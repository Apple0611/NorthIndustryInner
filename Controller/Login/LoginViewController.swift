//
//  LoginViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/11.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    
    @IBOutlet weak var loginBG: UIImageView!
    
    @IBOutlet weak var loginLogo: UIImageView!
    @IBOutlet weak var userNameIcon: UIImageView!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWordIcon: UIImageView!

    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var userNameBG: UIView!
    
    @IBOutlet weak var passwordBG: UIView!

    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="登录"
        
        
        let leftImageBtn=UIButton(type: .Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 13, 23)
        leftImageBtn.setImage(UIImage(named: "whiteBG.png"), forState: UIControlState.Normal)
        let leftBtn=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtn

        
        
        userNameBG.layer.cornerRadius=3
        passwordBG.layer.cornerRadius=3
        
        userName?.placeholder="用户名"
        userName?.keyboardType=UIKeyboardType.NumberPad
        userName.textColor=Globals.grayColor()
        userName?.font=UIFont.systemFontOfSize(14)
        
        passWord?.keyboardType=UIKeyboardType.ASCIICapable
        passWord?.placeholder="密码"
        passWord.textColor=Globals.grayColor()
        passWord?.font=UIFont.systemFontOfSize(14)
        passWord?.secureTextEntry=true
        passWord?.returnKeyType=UIReturnKeyType.Done

        
        loginBtn.backgroundColor=UIColor.whiteColor()
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.titleLabel?.font=UIFont.systemFontOfSize(16)
        loginBtn.layer.cornerRadius=3
        loginBtn.setTitleColor(Globals.blueColor(), forState: UIControlState.Normal)
        
        loginBtn.addTarget(self, action: #selector(LoginViewController.loginBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    
    func loginBtnAction() -> Void {
        
        
        self.navigationController?.popViewControllerAnimated(false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=false
    }
    
    
    


}
