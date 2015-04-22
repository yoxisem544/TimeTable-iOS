//
//  KeychainViewController.swift
//  WeekTable
//
//  Created by David on 2015/4/21.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class KeychainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var keychain = KeychainAccess()
        keychain.setPasscode("weektable", passcode: "")
        keychain.setPasscode("weektable-oauth", passcode: "KJSUW-2TG6D-6SLJF-HQP9Y")
        println(keychain.getPasscode("weektable"))
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
