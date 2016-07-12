//
//  InformationBoardViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/11.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class InformationBoardViewController: BaseViewController,UIScrollViewDelegate {

    var categoryNameArray:NSMutableArray=NSMutableArray()
    
    var sepWidth:CGFloat = 0.0
    var categoryBtnWidth:CGFloat = 0.0
    var categoryMovingImage:UIImageView=UIImageView(frame: CGRectZero)
    let categoryView:UIView=UIView()
    let infoScrollView:UIScrollView=UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="信息大厅"
        
        let rightImageBtn=UIButton(type:.Custom)
        rightImageBtn.frame=CGRectMake(0, 0, 26, 26)
        rightImageBtn.setImage(UIImage(named: "search.png"), forState: UIControlState.Normal)
        rightImageBtn.setImage(UIImage(named: "search.png"), forState: UIControlState.Highlighted)
        rightImageBtn.addTarget(self, action: #selector(InformationBoardViewController.searchBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let rightBtnItem:UIBarButtonItem=UIBarButtonItem(customView: rightImageBtn)
        self.navigationItem.rightBarButtonItem=rightBtnItem
        
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(InformationBoardViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        categoryNameArray=["采购","预告","变更","中标"]
        
        categoryView.frame=CGRectMake(0, 0, Globals.SCREEN_WIDTH(),60)
        let categorySepLine:UIView=UIView(frame: CGRectMake(0, 59, Globals.SCREEN_WIDTH(), 1))
        categorySepLine.backgroundColor=UIColor.lightGrayColor()
        categoryView.addSubview(categorySepLine)
        
        sepWidth=15
        categoryBtnWidth=(Globals.SCREEN_WIDTH()-(CGFloat)(sepWidth*7))/4
        
        for i in 0  ..< 4 {
            let categoryBtn=UIButton(frame: CGRectMake(sepWidth*(CGFloat)(i+2)+categoryBtnWidth*(CGFloat)(i), 0, categoryBtnWidth, 50))
            categoryBtn.tag=100000+i
            categoryView .addSubview(categoryBtn)
            categoryBtn.backgroundColor=UIColor.whiteColor()
            categoryBtn.setTitle(categoryNameArray[i] as? String, forState: UIControlState.Normal)
            categoryBtn.setTitle(categoryNameArray[i] as? String, forState: UIControlState.Selected)
            categoryBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            categoryBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
            categoryBtn.titleLabel?.font=UIFont.systemFontOfSize(16)
            categoryBtn.addTarget(self, action: #selector(InformationBoardViewController.categoryBtnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
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
        infoScrollView.contentSize=CGSizeMake(Globals.SCREEN_WIDTH()*4, infoScrollView.frame.size.height)
        infoScrollView.delegate=self
        infoScrollView.showsVerticalScrollIndicator=false
        infoScrollView.showsHorizontalScrollIndicator=false
        infoScrollView.pagingEnabled=true
        infoScrollView.backgroundColor=UIColor.whiteColor()
        self.view.addSubview(infoScrollView)
        
        
        let purchaseTableView:InfoBoardListTableView=InfoBoardListTableView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height))

        let forNoticeTableView:InfoBoardListTableView=InfoBoardListTableView(frame: CGRectMake(Globals.SCREEN_WIDTH(), 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height))
        
        let changeTableView:InfoBoardListTableView=InfoBoardListTableView(frame: CGRectMake(Globals.SCREEN_WIDTH()*2, 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height))

        let bidTableView:InfoBoardListTableView=InfoBoardListTableView(frame: CGRectMake(Globals.SCREEN_WIDTH()*3, 0, Globals.SCREEN_WIDTH(), infoScrollView.frame.size.height))
        
        infoScrollView.addSubview(purchaseTableView)
        infoScrollView.addSubview(forNoticeTableView)
        infoScrollView.addSubview(changeTableView)
        infoScrollView.addSubview(bidTableView)
        
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
    
    func searchBtnAction() -> Void {
        
    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
//    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView; {
//    CGPoint point=scrollView.contentOffset;
//    NSInteger page=(NSInteger)point.x/SCREEN_WIDTH;
//    if (page==0) {
//    [_selectLineView setFrame:CGRectMake(0, 39, SCREEN_WIDTH/2, 1)];
//    _voucheButton.selected=NO;
//    _accountBalanceBtn.selected=YES;
//    }else{
//    [_selectLineView setFrame:CGRectMake(SCREEN_WIDTH/2, 39, SCREEN_WIDTH/2, 1)];
//    _voucheButton.selected=YES;
//    _accountBalanceBtn.selected=NO;
//    if (!_isVoucherRequest) {
//    [self loadVoucherListNextPageRefresh];
//    }
//    }
//    }



}
