//
//  UniversityListCell.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import UIKit

class UniversityListCell: UITableViewCell {

    @IBOutlet weak var viewArrow: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblState: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewArrow.layer.cornerRadius = self.viewArrow.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
