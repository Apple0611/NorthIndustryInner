//
//  FAQViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class FAQViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="常见问题"
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(FAQViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }


}
