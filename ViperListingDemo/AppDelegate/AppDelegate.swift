//
//  AppDelegate.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let initialViewControlleripad : ViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = UniversityRouter.createModule()
        let navCon = UINavigationController(rootViewController: initialViewController)
//        navCon.navigationBar.isHidden = true
        self.window?.rootViewController = navCon
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

