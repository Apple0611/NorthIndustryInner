//
//  HomeViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/10.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var tabTitleArray:NSMutableArray=NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="首页"
        if !LoginInfo.sharedLoginInfo().isLogin {
            let loginViewController:LoginViewController=LoginViewController()
            self.navigationController?.pushViewController(loginViewController, animated: false)
        }
        
        let rightImageBtn=UIButton(type:.Custom)
        rightImageBtn.frame=CGRectMake(0, 0, 34, 24)
        rightImageBtn.setImage(UIImage(named: "message.png"), forState: UIControlState.Normal)
        rightImageBtn.setImage(UIImage(named: "message.png"), forState: UIControlState.Highlighted)
        let rightBtnItem:UIBarButtonItem=UIBarButtonItem(customView: rightImageBtn)
        self.navigationItem.rightBarButtonItem=rightBtnItem

        
        let adImageView:UIImageView=UIImageView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), Globals.SCREEN_WIDTH()/2.2))
        adImageView.image=UIImage(named: "bg.jpg")
        self.view .addSubview(adImageView)
        
        let tabHeight=2*Globals.SCREEN_WIDTH()/3
        let tabBGView:UIView=UIView(frame: CGRectMake(0,Globals.SCREEN_WIDTH()/2.2,Globals.SCREEN_WIDTH(),tabHeight))
        self.view.addSubview(tabBGView)
        tabBGView.backgroundColor=UIColor.blueColor()
        

        tabTitleArray=["信息大厅","采购审核","供应商管理","个人中心","下载专区","物资行情"]
        let numPerRow=3
        for i in 0  ..< 6  {
            let row=i/numPerRow
            let col=i%numPerRow
            let tabWidthAndHeight=Globals.SCREEN_WIDTH()/3
            let btnX=(CGFloat)(col)*tabWidthAndHeight
            let btnY=(CGFloat)(row)*tabWidthAndHeight
            let tabBtn:UIButton=UIButton(frame: CGRectMake(btnX,btnY,tabWidthAndHeight,tabWidthAndHeight))
            tabBtn.tag=100000+i
            tabBtn.backgroundColor=UIColor.whiteColor()
            tabBtn.addTarget(self, action: #selector(HomeViewController.tabButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            tabBGView .addSubview(tabBtn)
            
            let tabImage:UIImageView=UIImageView(frame: CGRectMake(35, 15, tabWidthAndHeight-70, tabWidthAndHeight-70))
            tabImage.layer.cornerRadius=(tabWidthAndHeight-70)/2
            tabImage.image=UIImage(named: "followBtn.png")
            tabBtn .addSubview(tabImage)
            
            let tabTitle:UILabel=UILabel(frame: CGRectMake(35, tabWidthAndHeight-45, tabWidthAndHeight-60, 21))
            tabTitle.text=tabTitleArray[i] as? String
            tabTitle.font=UIFont.systemFontOfSize(12)
            tabTitle.textAlignment=NSTextAlignment.Center
            tabTitle.textColor=UIColor.blackColor()
            tabBtn.addSubview(tabTitle)
            
        }
        
        let tableViewY=Globals.SCREEN_WIDTH()/2.2+tabHeight   //上两个控件总高度
        
        tableView=UITableView(frame: CGRectMake(0, tableViewY, Globals.SCREEN_WIDTH(), self.view.frame.size.height-tableViewY), style: UITableViewStyle.Plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.clearColor()
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        self.view .addSubview(tableView)


    }
    
    func tabButtonTapped(sender: AnyObject) -> Void {
        if sender.tag==100000 {
            let informationBoardViewController:InformationBoardViewController=InformationBoardViewController()
            self.navigationController?.pushViewController(informationBoardViewController, animated: true)
        }else if sender.tag==100001 {
            let procurementAuditViewController:ProcurementAudiViewController=ProcurementAudiViewController()
            self.navigationController?.pushViewController(procurementAuditViewController, animated: true)
        }else if sender.tag==100002 {
            
        }else if sender.tag==100003 {
            
        }else if sender.tag==100004 {
            
        }else if sender.tag==100005 {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Globals.HOMEPAGE_CELL_HEIGHT()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="HomeListTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? HomeListTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("HomeListTableViewCell", owner: self, options: nil))[0] as? HomeListTableViewCell
        }
        cell?.endTime.text="截止时间 2016-06-06 09:20"
        cell?.openTime.text="开标时间 2016-06-06 09:20"
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let homeListDetailViewController:HomeListDetailViewController=HomeListDetailViewController()
        self.navigationController?.pushViewController(homeListDetailViewController, animated: true)
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section==0 {
            let headView:UIView=UIView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), 30))
            headView.backgroundColor=UIColor.whiteColor()
            let sepLineUp:UIView=UIView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), 1))
            sepLineUp.backgroundColor=UIColor.lightGrayColor()
            let sepLineDown:UIView=UIView(frame: CGRectMake(0, 29, Globals.SCREEN_WIDTH(), 1))
            sepLineDown.backgroundColor=UIColor.lightGrayColor()
            
            let noticeLabel:UILabel=UILabel(frame: CGRectMake(10, 0, 60, 30))
            noticeLabel.textAlignment=NSTextAlignment.Left
            noticeLabel.textColor=UIColor.blackColor()
            noticeLabel.text="最新公告"
            noticeLabel.font=UIFont.systemFontOfSize(15)
            headView .addSubview(noticeLabel)
            headView.addSubview(sepLineUp)
            headView.addSubview(sepLineDown)
            return headView
        }
        else{
            return nil
        }
    }

}
