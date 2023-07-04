//
//  Constants.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import Foundation

struct Constants {
    
    static let API_URL = "https://www.googleapis.com/youtube/v3/playlistItems"
    
    static let SAMPLE_PLAYLIST_ID = "PLSaac19x1K73ilf4uHaad6-9sf3hjfcI8"
    
    static var API_KEY: String? {
        guard let configFileURL = Bundle.main.url(forResource: "config", withExtension: "json"),
              let configFileData = try? Data(contentsOf: configFileURL),
              let json = try? JSONSerialization.jsonObject(with: configFileData, options: []),
              let configDict = json as? [String: Any],
              let apiToken = configDict["API_KEY"] as? String else {
            print("Invalid or missing API token in the configuration file.")
            return nil
        }
        
        return apiToken
    }
}
