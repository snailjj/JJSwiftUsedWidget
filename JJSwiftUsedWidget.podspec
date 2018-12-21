#
# Be sure to run `pod lib lint JJSwiftUsedWidget.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJSwiftUsedWidget'
  s.version          = '0.1.4.41'
  s.summary          = '一些项目用到的封装控件'
  s.swift_version    = '4.1'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/snailjj/JJSwiftUsedWidget'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snailjj' => 'snail5jj@hotmail.com' }
  s.source           = { :git => 'https://github.com/snailjj/JJSwiftUsedWidget.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.snailjj.com'
  s.ios.deployment_target = '8.0'

    s.subspec 'PaymentCodeInputView' do |pciv|
        pciv.source_files = 'JJSwiftUsedWidget/PaymentCodeInputView/*.swift'
    end
    
    s.subspec 'CircleCountDownView' do |ccdv|
        ccdv.source_files = 'JJSwiftUsedWidget/CircleCountDownView/*.swift'
    end
  
  # s.resource_bundles = {
  #   'JJSwiftUsedWidget' => ['JJSwiftUsedWidget/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
