//
//  AppDelegate.swift
//  BugShaker
//
//  Created by git on 12/18/2015.
//  Copyright (c) 2015 git. All rights reserved.
//

import UIKit

import BugShaker

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BugShakerDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    /**
    *  Configure BugShaker with an array of email recipients (required)
    *  and an optional custom subject line to use for all bug reports.
    */

    BugShaker.configure(to: ["example@email.com"], subject: "Bug Report", body: "Hi Developers, I am reporting a bug where ... ", delegate: self)
    
    return true
  }

    func shouldPresentReportPrompt() -> Bool {
        // here you can read some settings from user defaults and decide if you want to have the bug report alert to show up or not
        if NSUserDefaults.standardUserDefaults().stringForKey("CONFIG_ENABLE_BUGSHAKE") != "\(true)" {
            return false
        }
        return true
    }

}
