//
//  DownloadZoneTableViewCell.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class DownloadZoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleName: UILabel!

    @IBOutlet weak var downloadBtn: UIButton!
    
    @IBOutlet weak var sepLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        downloadBtn.layer.borderColor=UIColor.lightGrayColor().CGColor
        downloadBtn.layer.borderWidth=1
        downloadBtn.layer.cornerRadius=5
        self.selectionStyle=UITableViewCellSelectionStyle.None
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
