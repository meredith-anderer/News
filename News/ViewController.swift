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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the table view
        tableView.dataSource = self
        tableView.delegate = self
        // Dynamic row heights
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // Set delegate for the model
        model.delegate = self
        // Get the articles from the article model
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Make sure the segue is actually to a detail VC/ get reference to it.
        if let detailVC = segue.destination as? ArticleDetailViewController {
            // Detect the index path the user selected
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            //Get the article the user tapped on
            if indexPath.row < articles.count {
                let article = self.articles[indexPath.row]
                detailVC.articleURL = article.url
            }
        }
    }
}

extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        if indexPath.row < articles.count {
            let articleForCell = self.articles[indexPath.row]
            (cell as? ArticleCell)?.displayArticle(articleForCell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TO DO
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        // Set the articles property of the view controller to the articles passed back from the model
        self.articles = articles
        tableView.reloadData()
    }
}
