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

class ViewController: UIViewController {
    var response: Response?
    var universityArray: [University]?
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let stringPath = Bundle.main.path(forResource: "University", ofType: "json")
        guard let urlPath = Bundle.main.url(forResource: "University", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: urlPath)
            let decoder = JSONDecoder()
            response = try decoder.decode(Response.self, from: data)
            universityArray = response?.universities
        } catch let error  {
            print(error)
        }
        
        // Do any additional setup after loading the view.
        
        
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
        cell.detailTextLabel?.text = university.webPagesArray?[0] ?? "No domains"
        return cell
    }
}
