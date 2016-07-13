//
//  SupplierManagementTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class SupplierManagementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var sepLine: UIView!
    
    @IBOutlet weak var companyDetail: UILabel!
    
    @IBOutlet weak var companyDescription: UILabel!
    
    @IBOutlet weak var procurementStatus: UILabel!
    

    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
        companyDetail.textColor=UIColor.lightGrayColor()
        procurementStatus.textColor=UIColor.lightGrayColor()
        self.selectionStyle=UITableViewCellSelectionStyle.None
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
