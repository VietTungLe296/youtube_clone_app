//
//  VideoDetail.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI

struct VideoDetail: View {
    var video: Video
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(video.title)
                .bold()
            
            Text(video.publishedInString)
                .foregroundColor(.gray)
            
            YoutubeVideoPlayer(video: video)
                .aspectRatio(CGSize(width: 1280, height: 720), contentMode: .fit)
            
            ScrollView {
                Text(video.description)
            }
        }
        .font(.system(size: 19))
        .padding()
        .background(RGBColor.backgroundColor.edgesIgnoringSafeArea(.all))
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video())
    }
}
