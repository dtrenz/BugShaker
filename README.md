<img src="https://raw.githubusercontent.com/dtrenz/BugShaker/master/banner.png" width="50%" alt="BugShaker">

Shake to send a bug report!

[![CI Status](http://img.shields.io/travis/dtrenz/BugShaker.svg?style=flat)](https://travis-ci.org/dtrenz/BugShaker)
[![Version](https://img.shields.io/cocoapods/v/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)
![License](https://img.shields.io/cocoapods/l/BugShaker.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/BugShaker.svg?style=flat)
![Swift Version](https://img.shields.io/badge/swift-v2.3-blue.svg)
[![codecov.io](https://codecov.io/github/dtrenz/BugShaker/coverage.svg?branch=master)](https://codecov.io/github/dtrenz/BugShaker?branch=master)
[![Sponsored by Detroit Labs](https://img.shields.io/badge/sponsor-Detroit%20Labs-000000.svg?style=flat)](http://www.detroitlabs.com)

BugShaker allows your users to simply submit bug reports by shaking the device.
When a shake is detected, the current screen state is captured and the user is
prompted to submit a bug report via a mail composer with the screenshot attached.

**Android developers:** If you are looking for an Android library with similar functionality, check out [stkent/bugshaker-android](https://github.com/stkent/bugshaker-android).

## Screenshots

<a href="https://raw.githubusercontent.com/dtrenz/BugShaker/master/Screenshots/screenshot-1.png"><img src="https://raw.githubusercontent.com/dtrenz/BugShaker/master/Screenshots/screenshot-1.png" width="50%" alt="Report Prompt"></a>
<a href="https://raw.githubusercontent.com/dtrenz/BugShaker/master/Screenshots/screenshot-2.png"><img src="https://raw.githubusercontent.com/dtrenz/BugShaker/master/Screenshots/screenshot-2.png" width="50%" alt="Report Compose View"></a>

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

All you have to do to enable bug reporting is import `BugShaker` in your `AppDelegate`
and call the `configure()` method in `application:didFinishLaunchingWithOptions`,
passing in the array of email recipients and an optional custom subject line:

```swift
  import BugShaker

  @UIApplicationMain
  class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      /**
      *  Configure ShakeReport with an array of email recipients (required)
      *  and an optional custom subject line to use for all bug reports.
      */
      BugShaker.configure(to: ["example@email.com"], subject: "Bug Report")

      return true
    }

  }
```

**NOTE:** There is a known issue with using a mail compose view controller in a simulator. 
The mail view will either not display at all, or possibly crash the simulator. You will need 
to run the example on a device to test out the full report compose view functionality.

### Disabling

If you need to disable BugShaker's shake detection for any reason:

```swift
BugShaker.enabled = false
```

## Installation

BugShaker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BugShaker"
```

## Author

Dan Trenz ([@dtrenz](http://www.twitter.com/dtrenz)) c/o [Detroit Labs](http://www.detroitlabs.com)

## License

BugShaker is available under the Apache License, Version 2.0. See the LICENSE file for more info.
