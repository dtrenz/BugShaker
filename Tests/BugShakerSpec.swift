// https://github.com/Quick/Quick

import Quick
import Nimble

@testable import BugShaker

class BugShakerSpec: QuickSpec {
  override func spec() {
    
    let recipients = [ "test@email.com" ]
    let subject = "Bug Report"
    let body = "Hello, I found a bug in your app."
    
    describe("configure(to:, subject:, body:)") {
      
      it("configures BugShaker") {
        BugShaker.configure(to: recipients, subject: subject, body: body)
        
        expect(BugShaker.Config.recipients) == recipients
        expect(BugShaker.Config.subject) == subject
        expect(BugShaker.Config.body) == body
      }
      
    }
    
    describe("configure(to:, subject:)") {
      
      it("configures BugShaker") {
        BugShaker.configure(to: recipients, subject: subject)
        
        expect(BugShaker.Config.recipients) == recipients
        expect(BugShaker.Config.subject) == subject
        expect(BugShaker.Config.body).to(beNil())
      }
      
    }
    
  }
}
