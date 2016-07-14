//
//  MateriaQuotationViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class MateriaQuotationViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="物资行情"
        
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(MateriaQuotationViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        let rightImageBtn=UIButton(type:.Custom)
        rightImageBtn.frame=CGRectMake(0, 0, 26, 26)
        rightImageBtn.setImage(UIImage(named: "search.png"), forState: UIControlState.Normal)
        rightImageBtn.setImage(UIImage(named: "search.png"), forState: UIControlState.Highlighted)
        rightImageBtn.addTarget(self, action: #selector(MateriaQuotationViewController.searchBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let rightBtnItem:UIBarButtonItem=UIBarButtonItem(customView: rightImageBtn)
        self.navigationItem.rightBarButtonItem=rightBtnItem
        
        tableView=UITableView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), self.view.frame.size.height), style: UITableViewStyle.Plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.whiteColor()
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        self.view .addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func searchBtnAction() -> Void {

    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="MateriaQuotationTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MateriaQuotationTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("MateriaQuotationTableViewCell", owner: self, options: nil))[0] as? MateriaQuotationTableViewCell
        }
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
