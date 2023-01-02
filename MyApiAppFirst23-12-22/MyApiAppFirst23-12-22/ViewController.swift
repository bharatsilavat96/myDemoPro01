//
//  ViewController.swift
//  MyApiAppFirst23-12-22
//
//  Created by Bharat Silavat on 23/12/22.
//

import UIKit


struct Response: Codable {
    
    var archeive: [LargeArchieve]
    enum CodingKes : CodingKeys{
        
        
       case archeive
        
        
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan
        var response : Response?
        var largeArray : [LargeArchieve]?
        
        guard let myUrlPath = Bundle.main.url(forResource: "MyModel", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: myUrlPath)
            
            // MARK: - Now Decode The Data
            let decoder = JSONDecoder()
            response = try decoder.decode(Response.self, from: data)
            largeArray = response?.archeive
            print(largeArray)
            
        }catch let error{
            print(error)
        }
    }
    
}



