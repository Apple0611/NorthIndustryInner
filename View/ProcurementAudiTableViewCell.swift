//
//  ProcurementAudiTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/12.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class ProcurementAudiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleName: UILabel!

    @IBOutlet weak var audiStatus: UILabel!
    
    @IBOutlet weak var publishTime: UILabel!
    
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
        audiStatus.textColor=UIColor.lightGrayColor()
        publishTime.textColor=UIColor.lightGrayColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
