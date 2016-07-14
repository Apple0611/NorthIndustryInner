//
//  ModifyPasswordViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class ModifyPasswordViewController: BaseViewController {
    
    

    
    @IBOutlet weak var pwdOld: UILabel!
    
    @IBOutlet weak var pwdNew: UILabel!
    
    @IBOutlet weak var comfirmNewPwd: UILabel!
    
    @IBOutlet var pwdOldTextField: [UITextField]!
    
    @IBOutlet var pwdNewTextField: [UITextField]!

    @IBOutlet weak var confirmNewPwdTextField: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="修改密码"
        pwdOld.text="原密码"
        pwdNew.text="新密码"
        comfirmNewPwd.text="确认新密码"
        
        saveBtn.layer.cornerRadius=7
        saveBtn.layer.borderColor=UIColor.lightGrayColor().CGColor
        saveBtn.layer.borderWidth=1
        saveBtn.setTitle("保存", forState: UIControlState.Normal)
        saveBtn.setTitle("保存", forState: UIControlState.Selected)
        saveBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        saveBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        saveBtn.addTarget(self, action: #selector(ModifyPasswordViewController.saveBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(ModifyPasswordViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
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
    
    func saveBtnAction() -> Void {
        self.backBtnAction()
    }


}
