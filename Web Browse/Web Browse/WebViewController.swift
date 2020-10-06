import UIKit
import WebKit


class WebViewController: UIViewController {
    
    var webView: WKWebView? {
        return view as? WKWebView
    }
    
    
    lazy var backButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(WKWebView.goBack))
    
    lazy var forwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(WKWebView.goForward))
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    var url: URL? {
        get {
            return webView?.url
        }
        set {
            if let url = newValue {
                load(url: url)
            }
        }
    }
    
    func load(url: URL) {
        let request = URLRequest(url: url)
        webView?.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "http://www.packtpub.com") {
            let request = URLRequest(url: url)
            webView?.load(request)
        }
        
        toolbarItems = createToolbarItems()
        navigationItem.searchController = searchController
        
    }
    
    
    func createToolbarItems() -> [UIBarButtonItem] {
        return [backButton, forwardButton]
    }


}

