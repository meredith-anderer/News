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
    
    var articleURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Check that there's a url
        if let articleURL = articleURL, let url = URL(string: articleURL) {
            // Create the URLRequest object
            let request = URLRequest(url: url)
            // Load it in the webview
            webView.load(request)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
