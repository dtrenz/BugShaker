//
//  AppDelegate.swift
//  BugShaker
//
//  Created by Dan Trenz on 12/18/2015.
//  Copyright (c) 2015 Dan Trenz. All rights reserved.
//

import UIKit
import BugShaker


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    /**
    *  Configure BugShaker with an array of email recipients (required)
    *  and an optional custom subject line to use for all bug reports.
    */
    BugShaker.configure(to: [ "example@email.com" ], subject: "Bug Report", body: "Hi Developers, I am reporting a bug where...")
    
    return true
  }

}
