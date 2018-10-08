Pod::Spec.new do |spec|
  spec.name              = 'BugShaker'
  spec.version           = '0.5.0'
  spec.license           = { :type => 'Apache 2.0' }
  spec.homepage          = 'https://github.com/dtrenz/BugShaker'
  spec.documentation_url = 'http://dtrenz.github.io/BugShaker/'
  spec.authors           = { 'Dan Trenz' => 'dtrenz@gmail.com' }
  spec.summary           = 'Shake to submit a bug report (w/ screenshot) via email.'
  spec.source            = { :git => 'https://github.com/dtrenz/BugShaker.git', :tag => spec.version.to_s }
  spec.source_files      = 'Sources/*.swift'
  spec.swift_version     = '4.2'
  spec.platform          = :ios, '9.0'
  spec.frameworks        = 'UIKit', 'MessageUI'
  spec.requires_arc      = true
  spec.description       = <<-DESC
                         BugShaker allows your users to simply submit bug reports by shaking the device.
                         When a shake is detected, the current screen state is captured and the user is
                         prompted to submit a bug report via a mail composer with the screenshot attached.
                         DESC
  spec.screenshots       = [
                          'https://raw.githubusercontent.com/dtrenz/BugShaker/develop/Screenshots/screenshot-1.png',
                          'https://raw.githubusercontent.com/dtrenz/BugShaker/develop/Screenshots/screenshot-2.png',
                         ]
  spec.social_media_url  = 'https://twitter.com/dtrenz'
end
