//
//  LoginInfo.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/10.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class LoginInfo: NSObject {

    var userName:NSString!
    var passWord:NSString!
    var session:NSString!
    var isLogin:Bool=false
    
    
    
    class func sharedLoginInfo()->LoginInfo {
        struct Static {
            static var onceToken:dispatch_once_t=0
            static var instance:LoginInfo?=nil
        }
        dispatch_once(&Static.onceToken){
            Static.instance=LoginInfo()
        }
        return Static.instance!
        
    }
    
    
    override init() {
        super.init()
    }
    
    func setLoginInfo(userNameString:NSString,pwdString:NSString,sessionString:NSString)->Void{
        userName=userNameString
        passWord=pwdString
        session=sessionString
    }
    
}
