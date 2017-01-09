//
//  BugShaker.swift
//  Pods
//
//  Created by Dan Trenz on 12/10/15.
//

import UIKit
import MessageUI
import Device


final public class BugShaker {
    
<<<<<<< HEAD
    // MARK: - Types
=======
    /// Enable or disable shake detection
    public static var isEnabled = true
>>>>>>> swift-3.0
    
    struct Config {
        static var recipients: [String]?
        static var subject: String?
        static var body: String?
    }
    
<<<<<<< HEAD
    private typealias DiagnosticInfo = (modelName: String, appVersion: String, osVersion: String)
    
    // MARK: - Properties
    
    /// Enable or disable shake detection
    public static var isEnabled = true
    
    
    // MARK: - Methods
    
    // MARK: Configuration
    
    /// Set bug report email recipient(s), custom subject line and body.
    ///
    /// - Parameters:
    ///   - recipients: List of email addresses to which the report will be sent.
    ///   - subject: Custom subject line to use for the report email.
    ///   - body: Custom email body (plain text).
=======
    // MARK: - Configuration
    
    /**
     Set bug report email recipient(s), custom subject line and body.
     
     - Parameters:
     - recipients: List of email addresses to which the report will be sent.
     - subject:      Custom subject line to use for the report email.
     - body:         Custom email body (plain text).
     */
>>>>>>> swift-3.0
    public class func configure(to recipients: [String], subject: String?, body: String? = nil) {
        Config.recipients = recipients
        Config.subject = subject
        Config.body = body
    }
    
<<<<<<< HEAD
    // MARK: Helper Methods
    
    /// Create a timestamp string for NOW, in UTC.
    ///
    /// - Returns: Timestamp string (UTC)
    private static func createTimestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss 'UTC'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter.string(from: Date())
    }
    
    /// Returns diagnostic information that might be useful when troubleshooting.
    ///
    /// - Returns: A tuple of diagnostic info
    private static func diagnosticInfo() -> DiagnosticInfo {
        let appVersion: String = Bundle.main.appVersion ?? ""
        let modelName = String(describing: Device.version())
        let osVersion = String(describing: UIDevice.current.systemVersion)
        
        return DiagnosticInfo(modelName: modelName, appVersion: appVersion, osVersion: osVersion)
    }
    
    
    /// Generates a message body header continaing useful info for debugging.
    ///
    /// - Returns: Message body header
    fileprivate static func generateMessageHeader() -> String {
        var headerArray = [String]()
        
        let info = diagnosticInfo()
        
        headerArray += [ "My Device: " + info.modelName ]
        headerArray += [ "App Version: " + info.appVersion ]
        headerArray += [ "iOS Version: " + info.osVersion ]
        headerArray += [ "Time Stamp: " + createTimestamp() ]
        headerArray += [ "--------------------" ]
        
        return headerArray.joined(separator: "\r\n")
    }
    
=======
>>>>>>> swift-3.0
}


// MARK: - UIViewController Extension
extension UIViewController {
    
    // MARK: UIResponder
    
    override open var canBecomeFirstResponder: Bool {
        return true
    }
    
    override open func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard BugShaker.isEnabled && motion == .motionShake else { return }
        
        let cachedScreenshot = captureScreenshot()
        
        presentReportPrompt { [weak self] (action) in
            self?.presentReportComposeView(cachedScreenshot)
        }
    }
    
    // MARK: Alert
    
    func presentReportPrompt(_ reportActionHandler: @escaping (UIAlertAction) -> Void) {
        let actionSheet = UIAlertController(
            title: "Shake detected!",
            message: "Would you like to report a bug?",
            preferredStyle: .actionSheet
        )
        
        let reportAction = UIAlertAction(title: "Report A Bug", style: .default, handler: reportActionHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(reportAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    // MARK: Report methods
    
    /// Take a screenshot for the current screen state.
    ///
    /// - Returns: Screenshot image.
    func captureScreenshot() -> UIImage? {
        guard let layer = UIApplication.shared.keyWindow?.layer else { return nil }
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        layer.render(in: context)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
<<<<<<< HEAD
    /// Present the user with a mail compose view with the recipient(s), subject line and body
    /// pre-populated, and the screenshot attached.
    ///
    /// - Parameter screenshot: The screenshot to attach to the report.
=======
    /**
     Present the user with a mail compose view with the recipient(s), subject line and body
     pre-populated, and the screenshot attached.
     
     - parameter screenshot: The screenshot to attach to the report.
     */
>>>>>>> swift-3.0
    func presentReportComposeView(_ screenshot: UIImage?) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            
            guard let toRecipients = BugShaker.Config.recipients else {
                print("BugShaker – Error: No recipients provided. Make sure that BugShaker.configure() is called.")
                return
            }
            
            let messageHeader = BugShaker.generateMessageHeader()
            let defaultMessageBody = messageHeader + "\r\n\r\n" + (BugShaker.Config.body ?? "")
            
            mailComposer.setToRecipients(toRecipients)
            mailComposer.setSubject(BugShaker.Config.subject ?? "Bug Report")
            mailComposer.setMessageBody(defaultMessageBody, isHTML: false)
            mailComposer.mailComposeDelegate = self
            
            if let screenshot = screenshot, let screenshotJPEG = UIImageJPEGRepresentation(screenshot, CGFloat(1.0)) {
                mailComposer.addAttachmentData(screenshotJPEG, mimeType: "image/jpeg", fileName: "screenshot.jpeg")
            }
            
            present(mailComposer, animated: true, completion: nil)
        }
    }
    
}


// MARK: - MFMailComposeViewControllerDelegate
extension UIViewController: MFMailComposeViewControllerDelegate {
    
    public func mailComposeController(_ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error {
            print("BugShaker – Error: \(error)")
        }
        
        switch result {
        case .failed:
            print("BugShaker – Bug report send failed.")
            break
            
        case .sent:
            print("BugShaker – Bug report sent!")
            break

        default:
            // noop
            break
        }

        dismiss(animated: true, completion: nil)
    }

}
