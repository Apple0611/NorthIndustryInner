//
//  ProcurementAudiViewController.swift
//  NorthIndustryInner
//
//  Created by user on 16/7/12.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

//采购审核


import UIKit

class ProcurementAudiViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var audiTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="采购审核"
        let leftImageBtn=UIButton(type:.Custom)
        leftImageBtn.frame=CGRectMake(0, 0, 26, 26)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Normal)
        leftImageBtn.setImage(UIImage(named: "back.png"), forState: UIControlState.Highlighted)
        leftImageBtn.addTarget(self, action: #selector(ProcurementAudiViewController.backBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtnItem:UIBarButtonItem=UIBarButtonItem(customView: leftImageBtn)
        self.navigationItem.leftBarButtonItem=leftBtnItem
        
        audiTableView=UITableView(frame: CGRectMake(0, 0, Globals.SCREEN_WIDTH(), self.view.frame.size.height), style: UITableViewStyle.Plain)
        audiTableView.delegate=self
        audiTableView.dataSource=self
        audiTableView.backgroundColor=UIColor.clearColor()
        audiTableView.separatorStyle=UITableViewCellSeparatorStyle.None
        self.view .addSubview(audiTableView)
        
        
        // Do any additional setup after loading the view.
    }
    
    func backBtnAction() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Globals.PROCUREMENTAUDI_CELL_HEIGHT()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="ProcurementAudiTableViewCellIdentifier"
        var cell=(tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ProcurementAudiTableViewCell)
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("ProcurementAudiTableViewCell", owner: self, options: nil))[0] as? ProcurementAudiTableViewCell
        }
        cell?.titleName.text="不锈线材厂加热炉易地大修改造工程配套设备采购公告"
        cell?.publishTime.text="发布时间 2016-06-06 09:20"
        cell?.audiStatus.text="待审核"
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    

}
