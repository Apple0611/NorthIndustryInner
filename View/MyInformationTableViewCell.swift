//
//  MyInformationTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class MyInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var inforText: UITextField!
    
    @IBOutlet weak var categoryInfo: UILabel!

    @IBOutlet weak var rightArr: UIImageView!
    
    @IBOutlet weak var sepLine: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle=UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
