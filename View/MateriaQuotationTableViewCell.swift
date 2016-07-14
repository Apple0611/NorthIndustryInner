//
//  MateriaQuotationTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class MateriaQuotationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sepLine: UIView!
    
    @IBOutlet weak var contentText: UILabel!
    
    @IBOutlet weak var titleName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        timeLabel.textColor=UIColor.lightGrayColor()
        contentText.textColor=UIColor.lightGrayColor()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
