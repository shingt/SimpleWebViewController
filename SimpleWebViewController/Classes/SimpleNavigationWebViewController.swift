import UIKit

public class SimpleNavigationWebViewController: UINavigationController {

    var webViewController: SimpleWebViewController!

    public init(request: NSURLRequest) {
        webViewController = SimpleWebViewController(request: request)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: webViewController, action: #selector(SimpleWebViewController.doneButtonTapped))
        webViewController.navigationItem.rightBarButtonItem = doneButton

        super.init(rootViewController: webViewController)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
}
