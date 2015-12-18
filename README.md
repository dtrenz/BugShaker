# BugShaker

[![CI Status](http://img.shields.io/travis/detroit-labs/BugShaker.svg?style=flat)](https://travis-ci.org/detroit-labs/BugShaker)
[![Version](https://img.shields.io/cocoapods/v/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)
[![License](https://img.shields.io/cocoapods/l/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)
[![Platform](https://img.shields.io/cocoapods/p/BugShaker.svg?style=flat)](http://cocoapods.org/pods/BugShaker)

BugShaker allows your users to simply submit bug reports by shaking the device.
When a shake is detected, the current screen state is captured and the user is
prompted to submit a bug report via a mail composer with the screenshot attached.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**NOTE:** There is a known issue with using a mail compose view controller in a simulator
which causes some simulators simulator to crash. You will need to run the example on a
device to test out the full report mail functionality.

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
