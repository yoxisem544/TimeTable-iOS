//
//  ModalAnimationViewController.swift
//  WeekTable
//
//  Created by David on 2015/4/20.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class ModalAnimationViewController: UIViewController {
    
    var dialogView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var button = UIButton(frame: CGRectMake(20, 20, 50, 50))
        button.setImage(UIImage(named: "close"), forState: UIControlState.Normal)
        
        var imgView = UIImageView(frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height))
        var backgroundImage = UIImage(named: "back.png")
        imgView.image = backgroundImage
        
        // blur effect
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        imgView.addSubview(blurEffectView)

        
        self.view.addSubview(imgView)
        self.view.addSubview(button)
        
        dialogView = UIView(frame: CGRectMake(100, 100, 200, 200))
        dialogView.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(dialogView)
        
        
        let scale = CGAffineTransformMakeScale(0, 0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
//        UIView.animateWithDuration(0.7, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//            }, completion: nil)
        
//        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//        }, completion: nil)
        
        UIView.animateWithDuration(10.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)
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
