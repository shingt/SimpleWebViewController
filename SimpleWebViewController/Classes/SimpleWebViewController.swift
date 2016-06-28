import UIKit
import WebKit

public class SimpleWebViewController: UIViewController {
    var request: NSURLRequest?

    lazy var webView: WKWebView = {
        let webView = WKWebView()
        self.view.addSubview(webView)

        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }()

    lazy private var backBarButtonItem: UIBarButtonItem = {
        let bundle = NSBundle(forClass: self.classForCoder)
        let image = UIImage(named: "SimpleWebViewController.bundle/back", inBundle: bundle, compatibleWithTraitCollection: nil)
        let barButtonItem = UIBarButtonItem(image: image, style: .Plain, target: self, action: #selector(self.dynamicType.goBackButtonTapped))
        barButtonItem.width = 18.0
        return barButtonItem
    }()

    lazy private var forwardBarButtonItem: UIBarButtonItem = {
        let bundle = NSBundle(forClass: self.classForCoder)
        let image = UIImage(named: "SimpleWebViewController.bundle/forward", inBundle: bundle, compatibleWithTraitCollection: nil)
        let barButtonItem = UIBarButtonItem(image: image, style: .Plain, target: self, action: #selector(self.dynamicType.goForwardButtonTapped))
        barButtonItem.width = 18.0
        return barButtonItem
    }()

    lazy private var reloadBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(self.dynamicType.reloadButtonTapped))
        barButtonItem.width = 18.0
        return barButtonItem
    }()

    lazy private var activityBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(self.dynamicType.activityButtonTapped))
        barButtonItem.width = 18.0
        return barButtonItem
    }()

    public init(request: NSURLRequest) {
        super.init(nibName: nil, bundle: nil)

        self.request = request
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func loadView() {
        super.loadView()

        self.loadRequest(request!)
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        webView.frame = view.bounds
    }

    func goBackButtonTapped() {
        webView.goBack()
    }

    func goForwardButtonTapped() {
        webView.goForward()
    }

    func reloadButtonTapped() {
        webView.reload()
    }

    func activityButtonTapped() {
        guard let url = webView.URL ?? request?.URL else { return }

        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: nil)
    }

    func doneButtonTapped() {
        dismissViewControllerAnimated(true, completion: nil)
    }


    func loadRequest(request: NSURLRequest) {
        webView.loadRequest(request)
    }

    func updateToolBarItems() {
        backBarButtonItem.enabled = webView.canGoBack
        forwardBarButtonItem.enabled = webView.canGoForward

        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target:nil, action: nil)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target:nil, action: nil)

        let items = [
            fixedSpace,
            backBarButtonItem,
            flexibleSpace,
            forwardBarButtonItem,
            flexibleSpace,
            reloadBarButtonItem,
            flexibleSpace,
            activityBarButtonItem,
            fixedSpace
        ]
        toolbarItems = items

        if let navigationController = navigationController {
            navigationController.toolbar.barStyle = navigationController.navigationBar.barStyle
            navigationController.toolbar.tintColor = navigationController.navigationBar.tintColor
        }
    }

    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setToolbarHidden(false, animated: animated)
    }

    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.setToolbarHidden(true, animated: animated)
    }

    public override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        updateToolBarItems()
    }
}

// MARK: WKNavigationDelegate
extension SimpleWebViewController: WKNavigationDelegate {
    public func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        navigationItem.title = webView.title
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        updateToolBarItems()
    }

    public func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        navigationItem.title = webView.title
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        updateToolBarItems()
    }

    public func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        updateToolBarItems()
    }
}
