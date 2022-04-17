//
//  ArticleCell.swift
//  News
//
//  Created by mcmaster on 4/17/22.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay: Article?
    
    func displayArticle(_ article: Article) {
        // Clean up the cell before displaying the next article
        articleImageView.image = nil
        articleImageView.alpha = 0
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay?.title
        
        // ANimate the label into view
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        // Retrieve and display the image
        if let imageUrlString = articleToDisplay?.urlToImage{
            // Check if the image is in the cache
            if let imageData = CacheManager.retrieveData(imageUrlString){
                setImageForImageView(imageData)
            }
            // If the image isn't in the cache already, download it (and add it to the cache)

            else if let url = URL(string: imageUrlString) {
                let session = URLSession.shared
                let dataTask = session.dataTask(with: url, completionHandler: {data, response, error in
                    if let data = data, error == nil {
                        // Save the image to the cache
                        CacheManager.saveData(imageUrlString, data)
                        // Check to make sure that the url string the data task went off to download matches the article this cell is set to display
                        if self.articleToDisplay?.urlToImage == imageUrlString {
                            DispatchQueue.main.async {
                                self.setImageForImageView(data)
                            }
                        }
                    } else {
                        // Either there is an error or data returned is nil
                        return
                    }
                })
                
                dataTask.resume()
            }
        } else {
            // No image URL associated with this article
            return
        }
    }
    
    private func setImageForImageView(_ imageData: Data){
        self.articleImageView.image = UIImage(data: imageData)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.articleImageView.alpha = 1
        }, completion: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
