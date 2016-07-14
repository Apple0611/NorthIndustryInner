//
//  AboutUsViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class AboutUsViewController: BaseViewController {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var systemName: UILabel!
    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var checkUpdate: UIButton!
    @IBOutlet weak var copyright: UILabel!
    
    let backgroundView:UIView=UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="关于我们"
        // Do any additional setup after loading the view.
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(AboutUsViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        logo.image=UIImage(named: "followBtn.png")
        logo.layer.cornerRadius=logo.frame.size.width/2
        checkUpdate.layer.borderWidth=1
        checkUpdate.layer.borderColor=UIColor.lightGrayColor().CGColor
        checkUpdate.addTarget(self, action: #selector(AboutUsViewController.checkUpdateBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        copyright.text="Copyright 2014-2020 内蒙古北方重工业集团有限公司|版权所有"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func checkUpdateBtnAction() -> Void {
        
        let alertView:UIAlertController=UIAlertController(title: "提示", message: "当前已经是最新版本", preferredStyle: .Alert)
        let defult:UIAlertAction=UIAlertAction(title: "确定", style: .Default, handler: nil)
        alertView.addAction(defult)
        
        self .presentViewController(alertView, animated: true, completion: nil)
        

    }

    
}
