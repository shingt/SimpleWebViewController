Pod::Spec.new do |s|
  s.name             = 'SimpleWebViewController'
  s.version          = '0.0.1'
  s.summary          = "Simple wrapper for WKWebView"
  s.homepage         = "https://github.com/shingt/SimpleWebViewController"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shingt' => 'van.s.ver@gmail.com' }
  s.source           = { :git => "https://github.com/shingt/SimpleWebViewController.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'SimpleWebViewController/Classes/**/*'
  s.resources =    'SimpleWebViewController/Assets/Image.xcassets/**/*'
  s.resource_bundle = {
    'SimpleWebViewController' => ['SimpleWebViewController/SimpleWebViewController.bundle/*.png']
  }
end
