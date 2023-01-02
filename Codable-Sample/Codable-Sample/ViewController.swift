//
//  ViewController.swift
//  Codable-Sample
//
//  Created by Bharat Silavat on 23/12/22.
//

import UIKit

struct Response: Codable {
    var universities: [University]
    enum CodingKeys: CodingKey {
        case universities
    }
}
let url = "http://universities.hipolabs.com/search?country=India"

class ViewController: UIViewController, UITableViewDelegate {
    var response: Response?
    var universityArray: [University]?
    var responseData: Data = Data()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        performSession()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.universityArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sample", for: indexPath)
        guard let array = universityArray else {
            return cell
        }
        let university: University = array[indexPath.row]
        cell.textLabel?.text = university.name
        cell.detailTextLabel?.text = university.domains?[0] ?? "No domains"
        return cell
    }
}

// URL session
extension ViewController {
    
    func createRequest() -> URLRequest? {
        guard let uniUrl = URL(string: url) else {
            return nil
        }
        let request = URLRequest(url: uniUrl)
        return request
    }
    
    func performSession() {
        guard let request = self.createRequest() else {
            return
        }
        let configuration = URLSessionConfiguration.default
        let session = URLSession.init(configuration: configuration)
        let task = session.dataTask(with: request)
        task.delegate = self
        task.resume()
//        session.dataTask(with: request) { data, response, error in
//            guard error == nil else {
//                return
//            }
//
//            if let response = response as? HTTPURLResponse,
//               let data = data {
//                if response.statusCode == 200 {
//                    self.parseData(data)
//                }
//            }
//        }.resume()
        
    }
    
    func parseData(_ data: Data) {
        do {
            let decoder = JSONDecoder()
            universityArray = try decoder.decode([University].self, from: data)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.table.reloadData()
            }
            
        } catch let error  {
            print(error)
        }
    }
}

extension ViewController: URLSessionTaskDelegate, URLSessionDataDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard  error != nil else {
            return
        }
        self.parseData(responseData)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.responseData.append(data)
    }
}
