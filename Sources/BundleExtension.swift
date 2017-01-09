//
//  BundleExtension.swift
//  BugShaker
//
//  Created by Dan Trenz on 1/6/17.
//  Copyright © 2017 Dan Trenz. All rights reserved.
//

import Foundation


extension Bundle {
    
    var appVersion: String? {
        guard let releaseVersion = releaseVersion else { return nil }
        guard let buildVersion = buildVersion else { return nil }
        
        return "\(releaseVersion).\(buildVersion)"
    }
    
    var buildVersion: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var releaseVersion: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
}
