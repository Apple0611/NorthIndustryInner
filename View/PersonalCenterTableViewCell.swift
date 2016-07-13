//
//  PersonalCenterTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class PersonalCenterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var detaiArray: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var sepLine: UIView!
    
    @IBOutlet weak var logoIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor=UIColor.whiteColor()
        infoLabel.textColor=UIColor.blackColor()
        self.selectionStyle=UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
