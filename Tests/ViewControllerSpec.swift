// https://github.com/Quick/Quick

import Quick
import Nimble

@testable import BugShaker

class ViewControllerSpec: QuickSpec {
  override func spec() {
    
    describe("ViewController") {
      
      class MockViewController: UIViewController {
        var captureScreenshotWasCalled = false
        var presentReportPromptWasCalled = false
        
        override func captureScreenshot() -> UIImage? {
          captureScreenshotWasCalled = true
          return nil
        }
        
        override func presentReportPrompt(reportActionHandler: (UIAlertAction) -> Void) {
          presentReportPromptWasCalled = true
        }
      }
      
      var viewController: MockViewController!
      
      beforeEach {
        viewController = MockViewController()
      }
      
      it("can become first responder") {
        expect(viewController.canBecomeFirstResponder()) == true
      }
      
      context("when I shake the device") {
        
        beforeEach {
          viewController.motionEnded(.MotionShake, withEvent: nil)
        }
        
        it("takes a screenshot") {
          expect(viewController.captureScreenshotWasCalled) == true
        }
        
        it("presents the bug report prompt") {
          class MockViewController: UIViewController {
            var presentReportPromptWasCalled = false
            
            override func presentReportPrompt(reportActionHandler: (UIAlertAction) -> Void) {
              presentReportPromptWasCalled = true
            }
          }
          
          let viewController = MockViewController()
          
          viewController.motionEnded(.MotionShake, withEvent: nil)
          
          expect(viewController.presentReportPromptWasCalled) == true
        }
        
      }
      
    }
    
  }
}
