//
//  LoginViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/11.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    
    @IBOutlet weak var headIcon: UIImageView!
    @IBOutlet weak var userNameIcon: UIImageView!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWordIcon: UIImageView!

    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var userNameSep: UIView!

    @IBOutlet weak var passwordSep: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="登录"
        
        let leftImageBtn=UIButton(type: .Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 13, 23)
        leftImageBtn.setImage(UIImage(named: "whiteBG.png"), forState: UIControlState.Normal)
        let leftBtn=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtn

        
        headIcon.image=UIImage(named: "followBtn.png")
        headIcon.layer.cornerRadius=30
//        headIcon.layer.borderWidth=1
//        headIcon.layer.borderColor=UIColor.blackColor().CGColor
        
        
        userName?.placeholder="用户名"
        userName?.keyboardType=UIKeyboardType.NumberPad
        userName?.font=UIFont.systemFontOfSize(14)
        
        passWord?.keyboardType=UIKeyboardType.ASCIICapable
        passWord?.placeholder="密码"
        passWord?.font=UIFont.systemFontOfSize(14)
        passWord?.secureTextEntry=true
        passWord?.returnKeyType=UIReturnKeyType.Done

        userNameSep.backgroundColor=UIColor.blackColor()
        passwordSep.backgroundColor=UIColor.blackColor()
        
        loginBtn.backgroundColor=UIColor.whiteColor()
        loginBtn.backgroundColor=Globals.RGB(0xff, green: 0xb3, blue: 0xa7)
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.titleLabel?.font=UIFont.systemFontOfSize(16)
        loginBtn.layer.cornerRadius=7
        loginBtn.layer.borderWidth=1
        loginBtn.layer.borderColor=Globals.RGB(220, green: 220, blue: 220).CGColor
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        loginBtn.addTarget(self, action: #selector(LoginViewController.loginBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    
    func loginBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}
