//
//  ArticleModel.swift
//  News
//
//  Created by Meredith Anderer on 4/15/22.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article])
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    var apiKey = "47bcce4a067b4e46afe3a8c53abf896b"
    func getArticles() {
        // Fire off the request to the API
        // Create a string URL
        let stringURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=" + apiKey

        // Create a URL object
        if let url = URL(string: stringURL) {
            // Get the URL Session
            let session = URLSession.shared
            // Create the data task
            let dataTask = session.dataTask(with: url, completionHandler: {data, response, error in
                //Parse the returned JSON into article instances and pass it back to the view controller with the protocol and delegate pattern
                if let data = data, error == nil {
                    let decoder = JSONDecoder()
                    if let articleServie = try? decoder.decode(ArticleService.self, from: data), let articles = articleServie.articles {
                        DispatchQueue.main.async {
                            self.delegate?.articlesRetrieved(articles)
                        }
                    } else {
                        // Decoder couldn't parse the data into ArticleServie object/ there were no articles
                        return
                    }
                }
            })
            // Start the data task
            dataTask.resume()
        } else {
            // Couldn't create the URL object
            return
        }
        
    }
}
