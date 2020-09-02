Pod::Spec.new do |spec|
  spec.name = 'LingoHub'
  spec.version = '1.0.0'
  spec.summary = 'LingoHub iOS SDK for OTA localization updates'
  spec.homepage = 'https://lingohub.com'
  spec.author = { 'LingoHub Team' => 'support@lingohub.com' }
  spec.source = { :http => "https://github.com/lingohub/lh-ios-sdk/releases/download/1.0.0/LingoHub.framework.zip" }
  spec.license = { :type => "BSD-3-Clause" }

  spec.ios.deployment_target = '9.0'
  spec.ios.vendored_frameworks = "Frameworks/iOS/LingoHub.framework"

  spec.watchos.deployment_target = '2.0'
  spec.watchos.vendored_frameworks = "Frameworks/watchOS/LingoHub.framework"

  spec.tvos.deployment_target = '9.0'
  spec.tvos.vendored_frameworks = "Frameworks/tvOS/LingoHub.framework"

  spec.osx.deployment_target = '10.11'
  spec.osx.vendored_frameworks = "Frameworks/macOS/LingoHub.framework"
end