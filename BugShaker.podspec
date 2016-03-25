Pod::Spec.new do |s|
  s.name             = "BugShaker"
  s.version          = "0.2.1"
  s.summary          = "Shake to submit a bug report (w/ screenshot) via email."
  s.description      = <<-DESC
                       BugShaker allows your users to simply submit bug reports by shaking the device.
                       When a shake is detected, the current screen state is captured and the user is
                       prompted to submit a bug report via a mail composer with the screenshot attached.
                       DESC
  s.homepage         = "https://github.com/detroit-labs/BugShaker"
  s.screenshots      = [
                         "https://raw.githubusercontent.com/dtrenz/BugShaker/develop/Screenshots/screenshot-1.png",
                         "https://raw.githubusercontent.com/dtrenz/BugShaker/develop/Screenshots/screenshot-2.png",
                       ]
  s.license          = "MIT"
  s.author           = { "Dan Trenz" => "dtrenz@gmail.com" }
  s.source           = { :git => "https://github.com/detroit-labs/BugShaker.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/dtrenz"
  s.platform         = :ios, "8.3"
  s.requires_arc     = true
  s.source_files     = "Sources/**/*"
  s.frameworks       = "UIKit", "MessageUI"
end
