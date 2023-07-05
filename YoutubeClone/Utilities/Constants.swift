//
//  Constants.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import Foundation

struct Constants {
    static let API_URL = "https://www.googleapis.com/youtube/v3"
    
    static let SAMPLE_PLAYLIST_ID = "PLSaac19x1K73ilf4uHaad6-9sf3hjfcI8"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    
    static var API_KEY: String? {
        guard let configFileURL = Bundle.main.url(forResource: "config", withExtension: "json"),
              let configFileData = try? Data(contentsOf: configFileURL),
              let json = try? JSONSerialization.jsonObject(with: configFileData, options: []),
              let configDict = json as? [String: Any],
              let apiKey = configDict["API_KEY"] as? String else {
            print("Invalid or missing API token in the configuration file.")
            return nil
        }
        
        return apiKey
    }
    
    static var GID_SIGN_IN_ID: String? {
        guard let configFileURL = Bundle.main.url(forResource: "config", withExtension: "json"),
              let configFileData = try? Data(contentsOf: configFileURL),
              let json = try? JSONSerialization.jsonObject(with: configFileData, options: []),
              let configDict = json as? [String: Any],
              let gid = configDict["GID_SIGN_IN_ID"] as? String else {
            print("Invalid or missing Google Sign In in the configuration file.")
            return nil
        }
        
        return gid
    }
}
