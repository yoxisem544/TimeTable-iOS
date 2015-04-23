//
//  UserSettingViewController.swift
//  WeekTable
//
//  Created by David on 2015/4/23.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class UserSettingViewController: UIViewController {

    
    var userProfilePictiureWidth: CGFloat!
    var userProfilePictiureHeight: CGFloat!
    
    var userNameLabelHeight: CGFloat!
    var userNameLabelWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("load")
        // Do any additional setup after loading the view.
        self.userProfilePictiureWidth = 200
        self.userProfilePictiureHeight = 200
        
        self.userNameLabelHeight = 50
        self.userNameLabelWidth = self.view.frame.width
        
        self.view.addSubview(UIImageView(image: UIImage(named: "profile.jpg")))
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        self.view.addSubview(blurEffectView)
        self.view.addSubview(self.UserProfilePictureView())
        self.view.addSubview(self.UserNameLabel())
        var close = UIButton(frame: CGRectMake(self.view.frame.width-100, 100, 50, 50))
        close.setImage(UIImage(named: "close"), forState: UIControlState.Normal)
        close.setImage(UIImage(named: "Timetable"), forState: UIControlState.Selected)
        close.addTarget(self, action: "sayhi:", forControlEvents: UIControlEvents.TouchUpInside)
        close.addTarget(self, action: "touchdown:", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(close)
    }
    
    func sayhi(sender: AnyObject) {
        println("hi")
        var btn = sender as! UIButton
        btn.alpha = 1.0
    }
    
    func touchdown(sender: AnyObject) {
        println("down")
        var btn = sender as! UIButton
        btn.alpha = 0.5
    }
    
    func touchcancel(sender: AnyObject) {
        println("cancel")
    }
    
    func UserProfilePictureView() -> UIView {
        
        var imgview = UIImageView(frame: CGRectMake(0.0, 0.0, self.userProfilePictiureWidth, self.userProfilePictiureHeight))
        
        imgview.image = UIImage(named: "profile.jpg")
        imgview.layer.cornerRadius = self.userProfilePictiureHeight/2
        imgview.layer.masksToBounds = true
        
        imgview.layer.borderWidth = 1
        imgview.layer.borderColor = UIColor.whiteColor().CGColor
        
        imgview.center.x = self.view.center.x
        imgview.center.y = self.view.center.y/2

        
        return imgview as UIView
    }
    
    func UserNameLabel() -> UIView {
        
        var name = UILabel(frame: CGRectMake(0.0, 0.0, self.userNameLabelWidth, self.userNameLabelHeight))
        name.textAlignment = NSTextAlignment.Center
        name.text = "Some one"
        name.textColor = UIColor.whiteColor()
        name.font = UIFont(name: "HelveticaNeue-UltraLight", size: 36)
        
        name.center = CGPointMake(self.view.center.x, self.view.center.y/2 + 150)
        
        return name as UIView
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
