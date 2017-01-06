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
        
        override func presentReportPrompt(_ reportActionHandler: @escaping (UIAlertAction) -> Void) {
          presentReportPromptWasCalled = true
        }
      }
      
      var viewController: MockViewController!
      
      beforeEach {
        viewController = MockViewController()
      }
      
      it("can become first responder") {
        expect(viewController.canBecomeFirstResponder) == true
      }
      
      context("when I shake the device") {
        
        context("when BugShaker is enabled") {
          
          beforeEach {
            BugShaker.enabled = true
          }
          
          it("takes a screenshot") {
            viewController.motionEnded(.motionShake, with: nil)
            
            expect(viewController.captureScreenshotWasCalled) == true
          }
          
          it("presents the bug report prompt") {
            class MockViewController: UIViewController {
              var presentReportPromptWasCalled = false
                
              override func presentReportPrompt(_ reportActionHandler: @escaping (UIAlertAction) -> Void) {
                presentReportPromptWasCalled = true
              }
            }
            
            let viewController = MockViewController()
            
            viewController.motionEnded(.motionShake, with: nil)
            
            expect(viewController.presentReportPromptWasCalled) == true
          }
          
        }
        
        context("when BugShaker is disabled") {
          
          beforeEach {
            BugShaker.enabled = false
          }
          
          it("does not take a screenshot") {
            viewController.motionEnded(.motionShake, with: nil)
            
            expect(viewController.captureScreenshotWasCalled) == false
          }
          
          it("does not present the bug report prompt") {
            class MockViewController: UIViewController {
              var presentReportPromptWasCalled = false
              
              override func presentReportPrompt(_ reportActionHandler: @escaping (UIAlertAction) -> Void) {
                presentReportPromptWasCalled = true
              }
            }
            
            let viewController = MockViewController()
            
            viewController.motionEnded(.motionShake, with: nil)
            
            expect(viewController.presentReportPromptWasCalled) == false
          }
          
        }
        
      }
      
    }
    
  }
}
