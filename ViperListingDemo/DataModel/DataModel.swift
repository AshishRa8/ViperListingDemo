//
//  DataModel.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation
import RealmSwift

class UniversityModel: Object {
    @Persisted var alpha_two_code: String = ""
    @Persisted var country: String = ""
    @Persisted var name: String = ""
    @Persisted var stateprovince: String = ""
    @Persisted var webPages: List<String> = List<String>()
    @Persisted var domains: List<String> = List<String>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    func toUniversity() -> University {
        return University(
            alphaTwoCode: self.alpha_two_code,
            webPages: Array(self.webPages),
            country: self.country,
            domains: Array(self.domains),
            name: self.name,
            stateProvince: self.stateprovince.isEmpty ? nil : self.stateprovince
        )
    }
    
}

extension Results where Element: UniversityModel {
    func toUniversityArray() -> [University] {
        return self.map { $0.toUniversity() }
    }
}
