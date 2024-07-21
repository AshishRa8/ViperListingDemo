//
//  DetailVC.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import UIKit

class DetailVC: UIViewController {

    
    @IBOutlet weak var lblUniName: UILabel!
    @IBOutlet weak var lblUniState: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblCountryCode: UILabel!
    @IBOutlet weak var lblWebPage: UILabel!
    
    var universities : University?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
    }
    
    func setupData() {
        
        self.lblUniName.text = universities?.name
        self.lblUniState.text = universities?.stateProvince
        self.lblCountry.text = universities?.country
        self.lblCountryCode.text = universities?.alphaTwoCode
        self.lblWebPage.text = universities?.webPages[0]
    }

}
