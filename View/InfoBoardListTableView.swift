//
//  InfoBoardListTableView.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/12.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class InfoBoardListTableView: UIView,UITableViewDataSource,UITableViewDelegate{

    
    var titleNameArray:NSMutableArray?
    var openTimeArray:NSMutableArray?
    var endTimeArray:NSMutableArray?
    var listTableView:UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        listTableView=UITableView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), style: UITableViewStyle.Plain)
        listTableView!.backgroundColor=UIColor.whiteColor()
        openTimeArray=NSMutableArray()
        endTimeArray=NSMutableArray()
        titleNameArray=NSMutableArray()
        self.backgroundColor=UIColor.whiteColor()
        self.setOpenTimeArray()
        self.setEndTimeArray()
        self.setTitleNameArray()
        listTableView!.delegate=self
        listTableView!.dataSource=self
        self.addSubview(listTableView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return titleNameArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier="InfoBoardListIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? InfoBoardListTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("InfoBoardListTableViewCell", owner: self, options: nil))[0] as? InfoBoardListTableViewCell
        }
        cell?.endTime.text=endTimeArray![indexPath.row] as? String
        cell?.openTime.text=openTimeArray![indexPath.row] as? String
        cell?.titleName.text=titleNameArray![indexPath.row] as? String
        
        return cell!

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }


    
    //delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return Globals.INFORBOARDLIST_CELL_HEIGHT()
    }
    
    
    /////////后续写//////
    func setTitleNameArray() -> Void {
        titleNameArray=["工业废水收集、除油及事故水池工程采购公告","工业废水收集、除油及事故水池工程采购公告","工业废水收集、除油及事故水池工程采购公告","工业废水收集、除油及事故水池工程采购公告","工业废水收集、除油及事故水池工程采购公告","工业废水收集、除油及事故水池工程采购公告","工业废水收集、除油及事故水池工程采购公告"]
    }
    
    
    func setEndTimeArray() -> Void {
        openTimeArray=["开标时间  2016-06-06  09：20","开标时间  2016-06-06  09：20","开标时间  2016-06-06  09：20","开标时间  2016-06-06  09：20","开标时间  2016-06-06  09：20","开标时间  2016-06-06  09：20","开标时间  2016-06-06  09：20"]

    }
    
    func setOpenTimeArray() -> Void {
        endTimeArray=["截止时间  2016-06-06  09：20","截止时间  2016-06-06  09：20","截止时间  2016-06-06  09：20","截止时间  2016-06-06  09：20","截止时间  2016-06-06  09：20","截止时间  2016-06-06  09：20","截止时间  2016-06-06  09：20"]

    }
}
