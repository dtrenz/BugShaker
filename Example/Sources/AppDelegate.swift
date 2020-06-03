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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    /**
    *  Configure BugShaker with an array of email recipients (required)
    *  and an optional custom subject line to use for all bug reports.
    */
    let fileName = "testFile.txt"
    let fileContent = "This is the content of the file."
    let file = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)

    try! fileContent.write(to: file, atomically: true, encoding: .utf8)

    let attachment = BugShaker.MailAttachment(data: try! Data(contentsOf: file), mimeType: "text/plain", fileName: fileName)

    BugShaker.configure(to: [ "example@email.com" ], subject: "Bug Report", body: "Hi Developers, I am reporting a bug where...", attachments: [attachment])
    
    return true
  }

}
