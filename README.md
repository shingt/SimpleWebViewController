# SimpleWebViewController

[![CI Status](http://img.shields.io/travis/shingt/SimpleWebViewController.svg?style=flat)](https://travis-ci.org/shingt/SimpleWebViewController)
[![Version](https://img.shields.io/cocoapods/v/SimpleWebViewController.svg?style=flat)](http://cocoapods.org/pods/SimpleWebViewController)
[![License](https://img.shields.io/cocoapods/l/SimpleWebViewController.svg?style=flat)](http://cocoapods.org/pods/SimpleWebViewController)
[![Platform](https://img.shields.io/cocoapods/p/SimpleWebViewController.svg?style=flat)](http://cocoapods.org/pods/SimpleWebViewController)

## SYNOPSYS

```swift
let url = NSURL(string: "https://apple.com")
let request = NSURLRequest(URL: url!)
let modalWebViewController = SimpleWebNavigationController(request: request)
presentViewController(modalWebViewController, animated: true, completion: nil)

// OR

let webViewController = SimpleWebViewController(request: request)
navigationController.pushViewController(webViewController, animated: true)
```

## Author

shingt

## License

SimpleWebViewController is available under the MIT license. See the LICENSE file for more info.
