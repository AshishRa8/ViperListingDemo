//
//  Entity.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation
import RealmSwift

struct University: Decodable{
    var alphaTwoCode: String
    var webPages: [String]
    var country: String
    var domains: [String]
    var name: String
    var stateProvince: String?
    
    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case country, domains, name
        case stateProvince = "state-province"
    }
    
}
