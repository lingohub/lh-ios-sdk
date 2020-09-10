Pod::Spec.new do |spec|
  spec.name = 'LingoHub'
  spec.version = '1.0.1'
  spec.summary = 'LingoHub iOS SDK for OTA localization updates'
  spec.homepage = 'https://lingohub.com'
  spec.author = { 'LingoHub Team' => 'support@lingohub.com' }
  spec.source = { :http => "https://github.com/lingohub/lh-ios-sdk/releases/download/1.0.1/LingoHub.xcframework.zip" }
  spec.license = { :type => "BSD-3-Clause" }

  spec.ios.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
  spec.osx.deployment_target = '10.11'
  spec.vendored_frameworks = "LingoHub.xcframework"
end