import UIKit
import WebKit


class WebViewController: UIViewController {
    
    var webView: WKWebView? {
        return view as? WKWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "http://www.packtpub.com") {
            let request = URLRequest(url: url)
            webView?.load(request)
        }
        
    }


}

