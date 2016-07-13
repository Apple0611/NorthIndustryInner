//
//  PersonalCenterViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class PersonalCenterViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var textArray:NSMutableArray=NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="个人中心"
        
        
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(PersonalCenterViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        
        let headView:UIView=UIView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(),Globals.SCREEN_WIDTH()/3))
        headView.backgroundColor=UIColor.whiteColor()
        
        let iconView:UIImageView=UIImageView(frame: CGRectMake((Globals.SCREEN_WIDTH()-60)/2, 15, 60, 60))
        iconView.layer.cornerRadius=30
        iconView.image=UIImage(named: "followBtn.png")
        headView.addSubview(iconView)
        
        let userName:UILabel=UILabel(frame: CGRectMake((Globals.SCREEN_WIDTH()-60)/2, 90, 60, 21))
        userName.text="XXXXX"
        userName.font=UIFont.systemFontOfSize(13)
        userName.textColor=UIColor.blackColor()
        headView.addSubview(userName)
        
        let sepLine:UIView=UIView(frame: CGRectMake(0, headView.frame.size.height-1, Globals.SCREEN_WIDTH(), 1))
        sepLine.backgroundColor=UIColor.lightGrayColor()
        headView.addSubview(sepLine)
        
        self.view.addSubview(headView)
        
        tableView=UITableView(frame: CGRectMake(0, headView.frame.size.height, Globals.SCREEN_WIDTH(), self.view.frame.size.height-headView.frame.size.height), style: UITableViewStyle.Plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.clearColor()
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        self.view .addSubview(tableView)
        
        textArray=["我的资料","功能介绍","常见问题","关于我们"]

    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="PersonalCenterTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PersonalCenterTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("PersonalCenterTableViewCell", owner: self, options: nil))[0] as? PersonalCenterTableViewCell
        }

        if indexPath.row < 4 {
            cell?.logoIcon.image=UIImage(named: "followBtn.png")
            cell?.detaiArray.image=UIImage(named: "right.png")
            cell!.infoLabel.text=textArray[indexPath.row] as? String
        }
        
        if indexPath.row==5 {
            let logoutBtn:UIButton=UIButton(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), 60))
            logoutBtn.setTitle("退出登录", forState: UIControlState.Normal)
            logoutBtn.setTitle("退出登录", forState: UIControlState.Selected)
            logoutBtn.titleLabel?.font=UIFont.systemFontOfSize(15)
            logoutBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            logoutBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
            cell?.addSubview(logoutBtn)
        }
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let homeListDetailViewController:HomeListDetailViewController=HomeListDetailViewController()
        self.navigationController?.pushViewController(homeListDetailViewController, animated: true)
    }

    


}
