Pod::Spec.new do |s|
  s.name             = "BugShaker"
  s.version          = "0.1.1"
  s.summary          = "Shake to submit a bug report (w/ screenshot) via email."
  s.description      = <<-DESC
                       BugShaker allows your users to simply submit bug reports by shaking the device.
                       When a shake is detected, the current screen state is captured and the user is
                       prompted to submit a bug report via a mail composer with the screenshot attached.
                       DESC
  s.homepage         = "https://github.com/detroit-labs/BugShaker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Dan Trenz" => "dtrenz@gmail.com" }
  s.source           = { :git => "https://github.com/detroit-labs/BugShaker.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dtrenz'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/BugShaker.Swift'
  s.frameworks = 'UIKit', 'MessageUI'
end
