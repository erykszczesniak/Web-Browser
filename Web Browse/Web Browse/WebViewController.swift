import UIKit
import WebKit


class WebViewController: UIViewController {
    
    var webView: WKWebView? {
        return view as? WKWebView
    }
    
    
    lazy var backButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(WKWebView.goBack))
    
    lazy var forwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(WKWebView.goForward))
    
        lazy var shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.share(sender:)))

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
        if UIApplication.shared.canOpenURL(url){
        let request = URLRequest(url: url)
        webView?.load(request)
        UserDefaults.standard.lastURL = url
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = UserDefaults.standard.lastURL
         toolbarItems = createToolbarItems()
         navigationItem.searchController = searchController
         searchController.searchBar.delegate = self
        
        
    }
    
    
    func createToolbarItems() -> [UIBarButtonItem] {
        return [backButton, forwardButton, shareButton]
    }


}

extension WebViewController {
   @objc func share(sender: UIBarButtonItem) {
    if let url = url {
        let sheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
    present(sheet, animated: true, completion: nil)
    }
    
        
    }
}

extension WebViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, let url = URL(string: text) {
            self.url = url
        }
    }
}
