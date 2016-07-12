//
//  InfoBoardListTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/12.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class InfoBoardListTableViewCell: UITableViewCell {

    @IBOutlet weak var sepLine: UIView!
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var openTime: UILabel!
    
    @IBOutlet weak var titleName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        openTime.textColor=UIColor.lightGrayColor()
        endTime.textColor=UIColor.lightGrayColor()
        self.selectionStyle=UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
