//
//  Interactor.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation
import RealmSwift
import ProgressHUD

protocol UniversityInteractorInputProtocol: AnyObject {
    func fetchUniversities()
}

protocol UniversityInteractorOutputProtocol: AnyObject {
    func universitiesFetchedSuccessfully(universities: [University])
    func universitiesFetchingFailed(error: Error)
}

class UniversityInteractor: UniversityInteractorInputProtocol {
    
    weak var presenter: UniversityInteractorOutputProtocol?
    private let networkManager = NetworkManager()
    
    func fetchUniversities() {
        
        if networkManager.isConnected {
        
            var request = URLRequest(url: URL(string:"http://universities.hipolabs.com/search?country=United%20Arab%20Emirates")!)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                // Check for HTTP response and data
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Invalid response or status code")
                    return
                }
                
                guard let data = data else {
                    print("No data returned")
                    return
                }
                
                do {
                    
                    //                    let array = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    //                    print(array)
                    
                    let universities = try JSONDecoder().decode([University].self, from: data)
                    self.presenter?.universitiesFetchedSuccessfully(universities: universities)
                    self.saveUniversity(from: universities)
                    print("University Count: \(universities.count)")
                } catch {
                    self.presenter?.universitiesFetchingFailed(error: error)
                }
            }
            
            task.resume()
        } else {
            
            // If Internet is not available then loads from Realm
            let realm = try! Realm()
            let universityResults: Results<UniversityModel> = realm.objects(UniversityModel.self)
            let universities: [University] = universityResults.toUniversityArray()
            print("Offline Uni: \(universities)")
            print("Uni Count: \(universities.count)")
            if universities.count > 0 {
                self.presenter?.universitiesFetchedSuccessfully(universities: universities)
            }
        }
    }

    func saveUniversity(from dictionary: [University]) {
        let realm = try! Realm()
        
        for dic in dictionary {
            let uni = UniversityModel()
            
            uni.alpha_two_code = dic.alphaTwoCode
            uni.country = dic.country
            uni.name = dic.name
            uni.stateprovince = dic.stateProvince ?? ""

            if dic.webPages.count > 0 {
                uni.webPages.append(dic.webPages.first!)
            }
            
            if dic.domains.count > 0 {
                uni.domains.append(dic.domains.first!)
            }

            try! realm.write {
                realm.add(uni, update: .modified)
            }
            
        }
     
    }
}
