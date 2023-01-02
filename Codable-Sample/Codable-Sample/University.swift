//
//  University.swift
//  Codable-Sample
//
//  Created by Bharat Silavat on 23/12/22.
//

import Foundation


struct University: Codable {
    var code: String?
    var name: String?
    var webPagesArray: [String]?
    var stateProvince: String?
    var domains: [String]?
    var country: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(code, forKey: .code)
        try container.encode(name, forKey: .name)
        try container.encode(webPagesArray, forKey: .webPagesArray)
        try container.encode(stateProvince, forKey: .stateProvince)
        try container.encode(domains, forKey: .domains)
        try container.encode(country, forKey: .country)
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        self.code  = try? values?.decode(String.self, forKey: .code) ?? nil
        self.name = try? values?.decode(String.self, forKey: .name) ?? nil
        self.webPagesArray = try? values?.decode(Array<String>.self, forKey: .webPagesArray) ?? []
        self.stateProvince = try? values?.decode(String.self, forKey: .stateProvince) ?? nil
        self.domains = try? values?.decode(Array<String>.self, forKey: .domains) ?? []
        self.country = try? values?.decode(String.self, forKey: .country) ?? nil
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case code = "alpha_two_code"
        case name
        case webPagesArray = "web_pges"
        case stateProvince = "state-province"
        case domains
        case country
    }

}
