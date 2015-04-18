//
//  TimeTableViewController.swift
//  WeekTable
//
//  Created by David on 2015/4/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class TimeTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var background = UIImageView(frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height))
        background.image = UIImage(named: "back2.png")
        self.view.addSubview(background)
        
        
        
        
        self.view.addSubview(self.WeekBarView())
        self.view.addSubview(self.TimeSideBarView())
        self.view.addSubview(self.TimeTableGridView())
    }
    
    func WeekBarView() -> UIView {
        
        var view = UIView(frame: CGRectMake(0.0, 0.0, self.view.frame.width, 64.0))
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        
        var timeSideBarWidth: CGFloat = 40
        
        // you got 5 days a week
        for day in 0...4 {
            let width = (self.view.frame.width - 40)/5
            var dayOffset = timeSideBarWidth + CGFloat(day)*width
            var dayView = UILabel(frame: CGRectMake(dayOffset, 20, 40, 40))
            dayView.text = "\(day+1)"
            dayView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
            dayView.textColor = UIColor.whiteColor()
            dayView.textAlignment = NSTextAlignment.Center
            dayView.layer.cornerRadius = 5
            dayView.layer.masksToBounds = true
            
            view.addSubview(dayView)
        }
        
        return view as UIView
    }
    
    func TimeSideBarView() -> UIView {
        
        var view = UIView(frame: CGRectMake(0.0, 64.0, 40, self.view.frame.height - 64))
        view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.7)
        
        // classes in moring NTU got 0 at the very first class
        // fuck cannot use class so i use session here
        for session in 0...8 {
            let height = (self.view.frame.height - 64)/9
            var classOffset = CGFloat(session)
            var sessionLabel = UILabel(frame: CGRectMake(0.0, classOffset*height, 30, 30))
            sessionLabel.text = "\(session)"
            sessionLabel.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.3, alpha: 0.7)
            sessionLabel.textAlignment = NSTextAlignment.Center
            sessionLabel.layer.cornerRadius = 15
            sessionLabel.layer.masksToBounds = true
            
            sessionLabel.center.x = 20
            
            view.addSubview(sessionLabel)
        }
        
        return view as UIView
    }
    
    func TimeTableGridView() -> UIView {
        
        var gridViewWidth = self.view.frame.width-40
        var gridViewHeight = self.view.frame.height-64
        
        var gridView = UIView(frame: CGRectMake(40, 64, self.view.frame.width-40, self.view.frame.height-64))
        gridView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.4)
        
        for i in 1...4 {
            let width = gridViewWidth/5
            var offset = CGFloat(i)
            var line = UIView(frame: CGRectMake(width*offset, 0.0, 0.5, gridViewHeight))
            
            line.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
            
            gridView.addSubview(line)
        }
        
        for i in 0...8 {
            let height = gridViewHeight/9
            var offest = CGFloat(i)
            var line = UIView(frame: CGRectMake(0.0, offest*height, gridViewWidth, 0.5))
            
            line.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.7)
            
            gridView.addSubview(line)
        }
        
        gridView.addSubview(self.addCourseView(0.0+0.5, y: 0.0+0.5))
        gridView.addSubview(self.addCourseView(gridViewWidth/5+0.5, y: gridViewHeight/9+0.5))
        
        return gridView as UIView
    }
    
    func addCourseView(x: CGFloat, y: CGFloat) -> UIView {
        var view = UIButton(frame: CGRectMake(x, y, 65, 65))
        view.backgroundColor = UIColor(red: 0.0, green: 0.3, blue: 0.7, alpha: 0.7)
        view.layer.cornerRadius = 10
        view.setTitle("S", forState: UIControlState.Normal)
        
        view.addTarget(self, action: "selectCourse:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return view as UIView
    }
    
    func selectCourse(sender: AnyObject) {
        println("hi \(sender)")
        var view = sender as! UIView
        view.center.x += 10
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
