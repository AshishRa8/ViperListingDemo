//
//  Router.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation
import UIKit

protocol UniversityRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

class UniversityRouter: UniversityRouterProtocol {
    static func createModule() -> UIViewController {
        let view = UniversityViewController()
        let presenter = UniversityPresenter()
        let interactor = UniversityInteractor()
        let router = UniversityRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
