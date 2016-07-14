//
//  PersonalInformationViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class MyInformationViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var categoryArray:NSMutableArray=NSMutableArray()
    var informationArray:NSMutableArray=NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="个人信息"
        
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(MyInformationViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        let rightBtn=UIButton(type:.Custom)
        rightBtn.frame=CGRectMake(0, 0, 60, 26)
        rightBtn.setTitle("保存", forState: UIControlState.Normal)
        rightBtn.setTitle("保存", forState: UIControlState.Selected)
        rightBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        rightBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        rightBtn.addTarget(self, action: #selector(MyInformationViewController.saveBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        rightBtn.titleLabel?.font=UIFont.systemFontOfSize(15)
        let rightBtnItem:UIBarButtonItem=UIBarButtonItem(customView: rightBtn)
        self.navigationItem.rightBarButtonItem=rightBtnItem
        
        tableView=UITableView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), self.view.frame.size.height), style:.Plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.clearColor()
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        tableView.scrollEnabled=false
        self.view .addSubview(tableView)
        
        let tapGestureRecognizer:UITapGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(MyInformationViewController.keyBoardHide))
        tapGestureRecognizer.cancelsTouchesInView=false
        tableView .addGestureRecognizer(tapGestureRecognizer)
        
        categoryArray=["姓名","部门","职位","公司","联系电话","","修改密码"]
        informationArray=["张三","采购部","采购专员","xxxx有限公司","18828808888","",""]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyBoardHide() -> Void {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func saveBtnAction() -> Void {
        self.backBtnAction()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="MyInformationTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MyInformationTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("MyInformationTableViewCell", owner: self, options: nil))[0] as? MyInformationTableViewCell
        }
        
        cell?.categoryInfo.text=categoryArray[indexPath.row] as? String
        cell?.inforText.text=informationArray[indexPath.row] as? String
        
        if indexPath.row==5 {
            cell?.rightArr.image=nil
        }else{
            cell?.rightArr.image=UIImage(named: "right.png")
        }
        
        if indexPath.row>=5  {
            cell?.inforText.userInteractionEnabled=false
        }
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row==6 {
            let modifyPasswordViewController:ModifyPasswordViewController=ModifyPasswordViewController()
            self.navigationController?.pushViewController(modifyPasswordViewController, animated: true)
        }
    }
    

    
}
