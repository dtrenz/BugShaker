//
//  NSBundleExtensions.swift
//  BugShaker
//
//  Created by Jake Payton on 6/24/16.
//  Copyright © 2016 Dan Trenz. All rights reserved.
//

import Foundation

extension NSBundle {

    var releaseVersion: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersion: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }

    var appVersion: String {
        return "\(self.releaseVersion!).\(self.buildVersion!)"
    }

}
