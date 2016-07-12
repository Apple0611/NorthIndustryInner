//
//  BaseViewController.swift
//  HuaXiFollowUp
//
//  Created by user on 16/4/7.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent=false
        self.tabBarController?.tabBar.translucent=false
        self.modalPresentationCapturesStatusBarAppearance=false
        self.extendedLayoutIncludesOpaqueBars=false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
