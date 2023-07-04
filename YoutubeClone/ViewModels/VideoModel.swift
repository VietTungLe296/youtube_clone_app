//
//  VideoModel.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import Foundation
import Alamofire

class ViewModel: ObservableObject {
    @Published var videos = [Video]()
    
    init() {
        getVideos()
    }
    
    private func getVideos() {
        // Create URL object
        guard let url = URL(string: "\(Constants.API_URL)/playlistItems") else {
            return
        }
        
        // Get a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // Create URL request
        let parameters: [String: Any] = [
            "part": "snippet",
            "playlistID": Constants.SAMPLE_PLAYLIST_ID,
            "key": Constants.API_KEY ?? ""
        ]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: Response.self, decoder: decoder) { response in
                // Check the status of the call
                switch response.result {
                case .success:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                }
                
                // Update the UI with the videos
                if let items = response.value?.items {
                    DispatchQueue.main.async {
                        self.videos = items
                    }
                }
            }
    }
}
