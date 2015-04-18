//
//  WeekTimeTableViewController.swift
//  WeekTable
//
//  Created by David on 2015/4/18.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class WeekTimeTableViewController: UIViewController {
    
    // header bar region
    var headerBarHeight: CGFloat!
    var headerBarWidth: CGFloat!
    var headerBarCellWidth: CGFloat!
    var headerBarCellHeight: CGFloat!
    
    // side bar region
    var sideBarHeight: CGFloat!
    var sideBarWidth: CGFloat!
    var sideBarCellHeight: CGFloat!
    var sideBarCellWidth: CGFloat!
    
    // grid view region
    var gridTimeTableHeight: CGFloat!
    var gridTimeTableWidth: CGFloat!
    var gridLineWidth: CGFloat!
    
    // screen region
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    // course counts?
    var courseCount: Int! = 9
    
    // color region
    var headerBarColor: UIColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
    var headerBarCellColor: UIColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
    var sideBarColor: UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.7)
    var sideBarCellColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 0.3, alpha: 0.7)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.screenHeight = self.view.frame.height
        self.screenWidth = self.view.frame.width
        
        // header bar setup
        self.headerBarHeight = 64.0
        self.headerBarWidth = self.screenWidth
        
        // side bar setup
        self.sideBarWidth = 40.0
        self.sideBarHeight = self.screenHeight - self.headerBarHeight
        
        // setup header cell item
        self.headerBarCellHeight = 30.0
        self.headerBarCellWidth = (self.screenWidth - self.sideBarWidth)/5
        
        // setup side bar cell item
        self.sideBarCellHeight = self.sideBarHeight/CGFloat(self.courseCount)
        self.sideBarCellWidth = self.sideBarWidth
        
        // adding views to user
        self.view.addSubview(self.HeaderBarView())
        self.view.addSubview(self.SideBarView())
    }
    
    
    func HeaderBarView() -> UIView {
        
        var view = UIView(frame: CGRectMake(0.0, 0.0, self.screenWidth, self.headerBarHeight))
        view.backgroundColor = self.headerBarColor
        
        for day in 0...4 {
            var dayView = UILabel(frame: CGRectMake(0.0, 0.0, self.headerBarCellWidth, self.headerBarCellHeight))
            dayView.text = "\(day+1)"
            dayView.backgroundColor = self.headerBarCellColor
            dayView.textAlignment = NSTextAlignment.Center
            dayView.layer.cornerRadius = self.headerBarCellHeight/2
            // let label can fit inside the mask
            dayView.layer.masksToBounds = true
            
            
            // position of x in every day
            var x = self.sideBarWidth + CGFloat(day)*self.headerBarCellWidth + self.headerBarCellWidth/2
            dayView.center = CGPointMake(x, self.headerBarHeight/2)
            
            view.addSubview(dayView)
        }
        
        return view as UIView
    }
    
    func SideBarView() -> UIView {
        
        var view = UIView(frame: CGRectMake(0.0, self.headerBarHeight, self.sideBarWidth, self.sideBarHeight))
        view.backgroundColor = self.sideBarColor
        
        // classes in moring NTU got 0 at the very first class
        // fuck cannot use class so i use session here
        for session in 0...(self.courseCount - 1) {
            var sessionLabel = UILabel(frame: CGRectMake(0.0, 0.0, self.sideBarCellWidth, self.sideBarCellHeight))
            sessionLabel.text = "\(session)"
            sessionLabel.backgroundColor = self.sideBarCellColor
            sessionLabel.textAlignment = NSTextAlignment.Center
            sessionLabel.layer.cornerRadius = 15
            sessionLabel.layer.masksToBounds = true
            
            
            var y = CGFloat(session)*self.sideBarCellHeight + self.sideBarCellHeight/2
            sessionLabel.center = CGPointMake(self.sideBarCellWidth/2, y)
            println("\(session)")
            
            view.addSubview(sessionLabel)
        }
        
        return view as UIView
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
