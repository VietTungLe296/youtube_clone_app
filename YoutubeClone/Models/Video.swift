//
//  Video.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import Foundation

struct Video: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    var publishedInString: String {
        CustomDateFormatter.getFormatted(self.published)
    }
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case title
        case description
        case thumbnails
        case high
        case thumbnail = "url"
        case published = "publishedAt"
        case resourceId
        case videoId
    }
    
    init() {
        self.videoId = "12345"
        self.title = "Sample video"
        self.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        self.thumbnail = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoCr6dhIe0zHTYAT7SHlggQ7syTtdNSDHipzh-_JZrBw&s"
        self.published = Date.now
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
    }
}
