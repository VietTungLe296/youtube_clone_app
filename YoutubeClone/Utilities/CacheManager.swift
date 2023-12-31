//
//  CacheManager.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import Foundation

class CacheManager {
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        // Store the image data with the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
