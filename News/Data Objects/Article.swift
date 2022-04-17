//
//  Article.swift
//  News
//
//  Created by Meredith Anderer on 4/15/22.
//

import Foundation

struct Article: Decodable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
}
