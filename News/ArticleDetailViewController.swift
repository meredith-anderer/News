//
//  ArticleDetailViewController.swift
//  News
//
//  Created by Meredith Anderer on 4/17/22.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        spinner.hidesWhenStopped = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Check that there's a url
        if let articleURL = articleURL, let url = URL(string: articleURL) {
            // Create the URLRequest object
            let request = URLRequest(url: url)
            
            // Start spinner
            spinner.startAnimating()
            // Load it in the webview
            webView.load(request)
        }
    }

}

extension ArticleDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Stop the spinner and hide it
        spinner.stopAnimating()
    }
}
