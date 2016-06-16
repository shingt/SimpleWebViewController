import UIKit
import SimpleWebViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = NSURL(string: "https://apple.com")
        let request = NSURLRequest(URL: url!)
        let webViewController = SimpleNavigationWebViewController(request: request)
        presentViewController(webViewController, animated: true, completion: nil)
    }
}
