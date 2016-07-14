//
//  DownloadZoneViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class DownloadZoneViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var titleArray:NSMutableArray=NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="下载专区"
        
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(DownloadZoneViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        
        tableView=UITableView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), self.view.frame.size.height), style: UITableViewStyle.Plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.backgroundColor=UIColor.whiteColor()
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        self.view .addSubview(tableView)
        
        titleArray=["操作手册","招标投标指南","采购流程说明","资料审核标准","中华人民共和国招投标法","中华人民共和国招投标法实施条例","电子招投标办法"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="DownloadZoneTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? DownloadZoneTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("DownloadZoneTableViewCell", owner: self, options: nil))[0] as? DownloadZoneTableViewCell
        }
        cell?.titleName.text=titleArray[indexPath.row] as? String
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
