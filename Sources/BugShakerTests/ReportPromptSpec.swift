// https://github.com/Quick/Quick

import Quick
import Nimble

@testable import BugShaker

class ReportPromptSpec: QuickSpec {
  override func spec() {
    
    describe("ReportPrompt") {
      
      class MockViewController: UIViewController {
        var alertTitle: String? = nil
        var alertMessage: String? = nil
        var reportActionTitle: String? = nil
        var cancelActionTitle: String? = nil
        
        override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
          if let alertController = viewControllerToPresent as? UIAlertController {
            alertTitle = alertController.title
            alertMessage = alertController.message
            
            if let reportAction = alertController.actions.first {
              reportActionTitle = reportAction.title
            }
            
            if let cancelAction = alertController.actions.last {
              cancelActionTitle = cancelAction.title
            }
          }
        }
      }
      
      var viewController: MockViewController!
      
      beforeEach {
        viewController = MockViewController()
      }
      
      context("when the report prompt is presented") {
        
        beforeEach {
          viewController.presentReportPrompt { (action) -> Void in
            // no-op
          }
        }
        
        it("the title should be: \"Shake Detected\"") {
          expect(viewController.alertTitle) == "Shake detected!"
        }
        
        it("the title should be: \"Would you like to report a bug?\"") {
          expect(viewController.alertMessage) == "Would you like to report a bug?"
        }
        
        it("the report action title should be: \"Report A Bug\"") {
          expect(viewController.reportActionTitle) == "Report A Bug"
        }
        
        it("the cancel action title should be: \"Cancel\"") {
          expect(viewController.cancelActionTitle) == "Cancel"
        }
      }
      
    }
    
  }
}
