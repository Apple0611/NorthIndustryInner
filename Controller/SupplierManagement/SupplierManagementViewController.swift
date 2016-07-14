//
//  SupplierManagementViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class SupplierManagementViewController: BaseViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {

    
    var categoryNameArray:NSMutableArray=NSMutableArray()
    var sepWidth:CGFloat = 0.0
    var categoryBtnWidth:CGFloat = 0.0
    var categoryMovingImage:UIImageView=UIImageView(frame: CGRectZero)
    let categoryView:UIView=UIView()
    let infoScrollView:UIScrollView=UIScrollView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title="供应商管理"
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(SupplierManagementViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem

        let rightImageBtn=UIButton(type:.Custom)
        rightImageBtn.frame=CGRectMake(0, 0, 70, 26)
        let textLabel=UILabel(frame: CGRectMake(15, 0, 50, 20))
        textLabel.text="筛选"
        textLabel.font=UIFont.systemFontOfSize(15)
        textLabel.textColor=UIColor.blackColor()
        rightImageBtn .addSubview(textLabel)
        let textImageView:UIImageView=UIImageView(frame: CGRectMake(50, 5, 10, 10))
        textImageView.image=UIImage(named: "down.png")
        rightImageBtn .addSubview(textImageView)
        let rightBtnItem:UIBarButtonItem=UIBarButtonItem(customView: rightImageBtn)
        self.navigationItem.rightBarButtonItem=rightBtnItem
        
        categoryNameArray=["供应商列表","供应商动态"]
        
        categoryView.frame=CGRectMake(0, 0, Globals.SCREEN_WIDTH(),60)
        let categorySepLine:UIView=UIView(frame: CGRectMake(0, 59, Globals.SCREEN_WIDTH(), 1))
        categorySepLine.backgroundColor=UIColor.lightGrayColor()
        categoryView.addSubview(categorySepLine)
        
        sepWidth=25
        categoryBtnWidth=(Globals.SCREEN_WIDTH()-(CGFloat)(sepWidth*5))/2
        
        for i in 0  ..< 2 {
            let categoryBtn=UIButton(frame: CGRectMake(sepWidth*(CGFloat)(i+2)+categoryBtnWidth*(CGFloat)(i), 0, categoryBtnWidth, 50))
            categoryBtn.tag=100000+i
            categoryView .addSubview(categoryBtn)
            categoryBtn.backgroundColor=UIColor.whiteColor()
            categoryBtn.setTitle(categoryNameArray[i] as? String, forState: UIControlState.Normal)
            categoryBtn.setTitle(categoryNameArray[i] as? String, forState: UIControlState.Selected)
            categoryBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            categoryBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
            categoryBtn.titleLabel?.font=UIFont.systemFontOfSize(16)
            categoryBtn.addTarget(self, action: #selector(SupplierManagementViewController.categoryBtnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            if i==0 {
                categoryBtn.selected=true
            }else{
                categoryBtn.selected=false
            }
        }
        categoryMovingImage.frame=CGRectMake(sepWidth*(CGFloat)(2)+categoryBtnWidth*(CGFloat)(0), 50, categoryBtnWidth, 4)
        categoryMovingImage.backgroundColor=UIColor.lightGrayColor()
        categoryView.addSubview(categoryMovingImage)
        self.view.addSubview(categoryView)
        
        
        infoScrollView.frame=CGRectMake(0, 60, Globals.SCREEN_WIDTH(),self.view.frame.size.height-categoryView.frame.size.height)
        infoScrollView.contentSize=CGSizeMake(Globals.SCREEN_WIDTH()*2, infoScrollView.frame.size.height)
        infoScrollView.delegate=self
        infoScrollView.showsVerticalScrollIndicator=false
        infoScrollView.showsHorizontalScrollIndicator=false
        infoScrollView.pagingEnabled=true
        infoScrollView.backgroundColor=UIColor.whiteColor()
        self.view.addSubview(infoScrollView)
        
        
        let supplierListTableView:UITableView=UITableView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height))
        supplierListTableView.backgroundColor=UIColor.whiteColor()
        supplierListTableView.delegate=self
        supplierListTableView.dataSource=self
        supplierListTableView.separatorStyle=UITableViewCellSeparatorStyle.None
        
        let supplierConditionTableView:UITableView=UITableView(frame: CGRectMake(Globals.SCREEN_WIDTH(), 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height))
         supplierConditionTableView.backgroundColor=UIColor.whiteColor()
        supplierConditionTableView.delegate=self
        supplierConditionTableView.dataSource=self
        supplierConditionTableView.separatorStyle=UITableViewCellSeparatorStyle.None
        
        infoScrollView.addSubview(supplierListTableView)
        infoScrollView.addSubview(supplierConditionTableView)



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Globals.SUPPLIERMANAGEMENT_CELL_HEIGHT()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="SupplierManagementTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? SupplierManagementTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("SupplierManagementTableViewCell", owner: self, options: nil))[0] as? SupplierManagementTableViewCell
        }
        cell?.companyName.text="XXX科技有限公司"
        cell?.companyDescription.text="注册资金：1000w  规模：300-500人  区域：西南地区"
        cell?.companyDetail.text="是一家集工业与民用建筑、安装、装修装饰、地基与基础、大型土石方、市场开发为一体的施工总承包企业；属房"
        cell?.procurementStatus.text="待审核"
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    
    func categoryBtnAction(sender: AnyObject) -> Void {
        for view in categoryView.subviews {
            if view.isKindOfClass(UIButton) {
                if sender.tag==view.tag {
                    let selectedBtn:UIButton=view as! UIButton
                    selectedBtn.selected=true
                    categoryMovingImage.frame=CGRectMake(sepWidth*(CGFloat)(sender.tag-100000+2)+categoryBtnWidth*(CGFloat)(sender.tag-100000), 50, categoryBtnWidth, 4)
                    infoScrollView.scrollRectToVisible(CGRectMake(Globals.SCREEN_WIDTH()*(CGFloat)(sender.tag-100000), 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height), animated: true)
                    
                }else {
                    let unSelectedBtn:UIButton=view as! UIButton
                    unSelectedBtn.selected=false
                }
            }
        }
    }

    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }


    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        let point:CGPoint=scrollView.contentOffset
        let page:NSInteger=(NSInteger)(point.x/Globals.SCREEN_WIDTH())
        for view in categoryView.subviews {
            if view.isKindOfClass(UIButton) {
                if page+100000==view.tag {
                    let selectedBtn:UIButton=view as! UIButton
                    selectedBtn.selected=true
                    categoryMovingImage.frame=CGRectMake(sepWidth*(CGFloat)(page+2)+categoryBtnWidth*(CGFloat)(page), 50, categoryBtnWidth, 4)
                    
                }else {
                    let unSelectedBtn:UIButton=view as! UIButton
                    unSelectedBtn.selected=false
                }
            }
        }
    }

}
