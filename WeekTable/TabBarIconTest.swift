//
//  TabBarIconTest.swift
//  WeekTable
//
//  Created by David on 2015/4/21.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class TabBarIconTest: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("loading \(self.tabBar.items)")
        
        var item0 = self.tabBar.items![0] as! UITabBarItem
        
        item0.title = "something"
        item0.image = UIImage(named: "Timetable")
        item0.selectedImage = UIImage(named: "Timetable")
        
        var item1 = self.tabBar.items![1] as! UITabBarItem
        item1.title = "another"
    }
   
}
