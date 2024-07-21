//
//  Presentor.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation

protocol UniversityViewProtocol: AnyObject {
    func displayUniversities(universities: [University])
    func displayError(error: Error)
}

protocol UniversityPresenterProtocol: AnyObject {
    func viewDidLoad()
}

class UniversityPresenter: UniversityPresenterProtocol {
    weak var view: UniversityViewProtocol?
    
    var interactor: UniversityInteractorInputProtocol?
    
    func viewDidLoad() {
            interactor?.fetchUniversities()
    }
}

extension UniversityPresenter: UniversityInteractorOutputProtocol {
    func universitiesFetchedSuccessfully(universities: [University]) {
        view?.displayUniversities(universities: universities)
    }
    
    func universitiesFetchingFailed(error: Error) {
        view?.displayError(error: error)
    }
}
