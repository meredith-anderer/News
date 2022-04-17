//
//  ViewController.swift
//  News
//
//  Created by mcmaster on 4/15/22.
//

import UIKit

class ViewController: UIViewController {

    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set delegate for the model
        model.delegate = self
        // Get the articles from the article model
        model.getArticles()
    }
    

}

extension ViewController: ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        // Set the articles property of the view controller to the articles passed back from the model
        self.articles = articles
    }
}
