# BugShaker

[![CI Status](http://img.shields.io/travis/detroit-labs/BugShaker.svg?style=flat)](https://travis-ci.org/detroit-labs/BugShaker)
[![Version](https://img.shields.io/cocoapods/v/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)
[![License](https://img.shields.io/cocoapods/l/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)
[![Platform](https://img.shields.io/cocoapods/p/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)

BugShaker allows your users to simply submit bug reports by shaking the device.
When a shake is detected, the current screen state is captured and the user is
prompted to submit a bug report via a mail composer with the screenshot attached.

## Screenshots

![Report Prompt](https://github.com/detroit-labs/BugShaker/blob/master/screenshot-1.png)
![Report Compose View](https://github.com/detroit-labs/BugShaker/blob/master/screenshot-2.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

All you have to do to enable bug reporting is import `BugShaker` in your `AppDelegate`
and call the `configure()` method in `application:didFinishLaunchingWithOptions`,
passing in the array of email recipients and an optional custom subject line:


### Basic usage

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

### Advanced usage

```swift
  import BugShaker

  @UIApplicationMain
  class AppDelegate: UIResponder, UIApplicationDelegate, BugShakerDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      /**
      *  Configure ShakeReport with an array of email recipients (required)
      *  and an optional custom subject line to use for all bug reports.
      */
      BugShaker.configure(to: ["example@email.com"], subject: "Bug Report", body: "Hi there, I am reporting a bug in which ...", delegate: self)

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
```


**NOTE:** There is a known issue with using a mail compose view controller in a simulator
which causes some simulators simulator to crash. You will need to run the example on a
device to test out the full report compose view functionality.

## Installation

BugShaker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BugShaker"
```

## Author

Dan Trenz ([@dtrenz](http://www.twitter.com/dtrenz)) c/o [Detroit Labs](http://www.detroitlabs.com)

## License

BugShaker is available under the MIT license. See the LICENSE file for more info.
