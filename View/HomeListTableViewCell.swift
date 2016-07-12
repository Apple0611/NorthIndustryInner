//
//  HomeListTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/11.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class HomeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoMark: UILabel!
    
    @IBOutlet weak var noticeTitle: UILabel!
    
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var openTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoMark.layer.borderColor=UIColor.lightGrayColor().CGColor
        logoMark.layer.borderWidth=1
        logoMark.textColor=UIColor.lightGrayColor()
        endTime.textColor=UIColor.lightGrayColor()
        openTime.textColor=UIColor.lightGrayColor()
        self.selectionStyle=UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
