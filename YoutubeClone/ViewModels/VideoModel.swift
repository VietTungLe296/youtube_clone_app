//
//  VideoModel.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import Foundation
import Alamofire

class VideoModel: ObservableObject {
    @Published var videos = [Video]()
    
    init() {
        getVideos()
    }
    
    private func getVideos(pageToken: String = "") {
        // Create URL object
        guard let url = URL(string: "\(Constants.API_URL)/playlistItems") else {
            return
        }
        
        // Get a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // Create URL request
        let parameters: [String: String] = [
            "part": "snippet",
            "playlistId": Constants.SAMPLE_PLAYLIST_ID,
            "key": Constants.API_KEY ?? "",
            "pageToken": pageToken
        ]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: Response.self, decoder: decoder) { response in
                if let responseCode = response.response?.statusCode {
                    print("Response code: \(responseCode)")
                }
                
                // Check the status of the call
                switch response.result {
                case .success:
                    // Update the UI with the videos
                    if let items = response.value?.items {
                        self.videos.append(contentsOf: items)
                        
                        if let nextPageToken = response.value?.nextPageToken {
                            self.getVideos(pageToken: nextPageToken)
                        } else {
                            DispatchQueue.main.async {
                                self.videos = self.videos
                            }
                            return
                        }
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
}
