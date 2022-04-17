//
//  ArticleService.swift
//  News
//
//  Created by Meredith Anderer on 4/15/22.
//

import Foundation

struct ArticleService: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}
