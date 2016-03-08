//
//  BugShaker.swift
//  Pods
//
//  Created by Dan Trenz on 12/10/15.
//

import UIKit
import MessageUI

public protocol BugShakerDelegate {
  func ShouldPresentReportPrompt() -> Bool
}

public class BugShaker {

  struct Config {
    static var toRecipients: [String]?
    static var subject: String?
    static var delegate: BugShakerDelegate?
    static var body: String?
  }
  
  // MARK: - Configuration
  
  /**
  Set bug report email recipient(s), custom subject line and body.
  
  - parameter toRecipients: List of email addresses to which the report will be sent.
  - parameter subject:      Custom subject line to use for the report email.
  - parameter body:         Custom email body (plain text).
  - parameter delegate:     optional delegate object that implements ShouldPresentReportPorompt and can basically disable or enable the bugshaker behavior
  */
    public class func configure(to toRecipients: [String]!, subject: String?, body: String?, delegate: BugShakerDelegate? = nil) {
    Config.toRecipients = toRecipients
    Config.subject = subject
    Config.body = body
    Config.delegate = delegate
  }
  
}

extension UIViewController: MFMailComposeViewControllerDelegate {
  
  // MARK: - UIResponder
  
  override public func canBecomeFirstResponder() -> Bool {
    return true
  }
  
  override public func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
    if motion == .MotionShake {
      let cachedScreenshot = captureScreenshot()

      if let delegate = BugShaker.Config.delegate {
        if (!delegate.ShouldPresentReportPrompt()) {
          return
        }
      }

      presentReportPrompt({ (action) -> Void in
        self.presentReportComposeView(cachedScreenshot)
      })
    }
  }
  
  // MARK: - Alert
  
  func presentReportPrompt(reportActionHandler: (UIAlertAction) -> Void) {
    let actionSheet = UIAlertController(title: "Shake detected!", message: "Would you like to report a bug?", preferredStyle: .ActionSheet)
    
    let reportAction = UIAlertAction(title: "Report A Bug", style: .Default, handler: reportActionHandler)
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { _ in }
    
    actionSheet.addAction(reportAction)
    actionSheet.addAction(cancelAction)
    
    presentViewController(actionSheet, animated: true, completion: nil)
  }
  
  
  // MARK: - Report methods
  
  /**
  Take a screenshot for the current screen state.
  
  - returns: Screenshot image.
  */
  func captureScreenshot() -> UIImage? {
    var screenshot: UIImage? = nil
    
    if let layer = UIApplication.sharedApplication().keyWindow?.layer {
      let scale = UIScreen.mainScreen().scale
      
      UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
      
      if let context = UIGraphicsGetCurrentContext() {
        layer.renderInContext(context)
      }
      
      screenshot = UIGraphicsGetImageFromCurrentImageContext()
      
      UIGraphicsEndImageContext()
    }
    
    return screenshot;
  }
  
  /**
   Present the user with a mail compose view with the recipient(s), subject line and body
   pre-populated, and the screenshot attached.
   
   - parameter screenshot: The screenshot to attach to the report.
   */
  func presentReportComposeView(screenshot: UIImage?) {
    if MFMailComposeViewController.canSendMail() {
      let mailComposer = MFMailComposeViewController()
      
      guard let toRecipients = BugShaker.Config.toRecipients else {
        print("BugShaker – Error: No recipients provided. Make sure that BugShaker.configure() is called.")
        return
      }
      
      mailComposer.setToRecipients(toRecipients)
      mailComposer.setSubject(BugShaker.Config.subject ?? "Bug Report")
      mailComposer.setMessageBody(BugShaker.Config.body ?? "", isHTML: false)
      mailComposer.mailComposeDelegate = self
      
      if let screenshot = screenshot, let screenshotJPEG = UIImageJPEGRepresentation(screenshot, CGFloat(1.0)) {
        mailComposer.addAttachmentData(screenshotJPEG, mimeType: "image/jpeg", fileName: "screenshot.jpeg")
      }
      
      presentViewController(mailComposer, animated: true, completion: nil)
    }
  }
  
  // MARK: - MFMailComposeViewControllerDelegate
  
  public func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
    if let error = error {
      print("BugShaker – Error: \(error)")
    }
    
    switch result {
    case MFMailComposeResultFailed:
      print("BugShaker – Bug report send failed.")
      break;
      
    case MFMailComposeResultSent:
      print("BugShaker – Bug report sent!")
      break;
      
    default:
      // noop
      break;
    }
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}
