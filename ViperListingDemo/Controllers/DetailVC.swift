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
    
    @IBOutlet weak var viewRefresh: UIView!
    @IBOutlet weak var btnRefresh: UIButton!
    
    var universities : University?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnRefresh.setTitle("", for: .normal)
        self.btnRefresh.titleLabel?.text = ""
        
        self.viewRefresh.layer.cornerRadius =
        self.viewRefresh.frame.size.height/2
        
        self.setupData()
    }
    
    @IBAction func onClicKRefresh(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setupData() {
        
        self.lblUniName.text = universities?.name
        self.lblUniState.text = universities?.stateProvince
        self.lblCountry.text = universities?.country
        self.lblCountryCode.text = universities?.alphaTwoCode
        self.lblWebPage.text = universities?.webPages[0]
    }

}
