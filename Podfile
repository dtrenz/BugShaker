source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
platform :ios, '9.3'

target 'BugShakerTests' do
  pod 'Quick', '< 0.10'
  pod 'Nimble', '< 5.0'
end

post_install do | installer |
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end
