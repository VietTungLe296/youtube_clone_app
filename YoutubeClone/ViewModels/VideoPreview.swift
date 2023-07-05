//
//  VideoPreview.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import Foundation
import Alamofire

class VideoPreview: ObservableObject {
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var video: Video
    
    init(video: Video) {
        self.video = video
        self.title = video.title
        self.date = video.publishedInString
        
        let videoThumbnail = video.thumbnail
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(videoThumbnail) {
            self.thumbnailData = cachedData
        } else {
            guard !videoThumbnail.isEmpty, let url = URL(string: videoThumbnail) else { return }
            AF.request(url)
                .validate()
                .responseData { response in
                    if let data = response.data {
                        CacheManager.setVideoCache(videoThumbnail, data)
                        
                        DispatchQueue.main.async  {
                            self.thumbnailData = data
                        }
                    }
                }
        }
    }
}
