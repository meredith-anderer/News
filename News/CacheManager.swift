//
//  CacheManager.swift
//  News
//
//  Created by Meredith Anderer on 4/17/22.
//

import Foundation

class CacheManager {
    //TO DO - make singleton so can make this private?
    static var imageDictionary = [String: Data]()
    
    static func saveData(_ url: String, _ imageData: Data) {
        // Save the image data along with the url
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(_ url: String) -> Data? {
        // Return the saved image data or nil if the image hasn't been cached yet
        return imageDictionary[url]
    }
}
