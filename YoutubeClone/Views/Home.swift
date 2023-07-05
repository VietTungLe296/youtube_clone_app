//
//  Home.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI

struct Home: View {
    @StateObject var model = VideoModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(model.videos, id: \.videoId) { video in
                    VideoRow(videoPreview: VideoPreview(video: video))
                        .padding()
                }
            }
        }
        .foregroundColor(.white)
        .background(RGBColor.backgroundColor)
        .animation(.easeOut, value: UUID())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
