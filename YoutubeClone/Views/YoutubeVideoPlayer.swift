//
//  YoutubeVideoPlayer.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer: UIViewRepresentable {
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        // Create the WebView
        let view = WKWebView()
        
        view.backgroundColor = UIColor(RGBColor.backgroundColor)
        
        // Create url for video
        let embedURLString = Constants.YT_EMBED_URL + video.videoId
        print(embedURLString)
        
        // Load the video into the WebView
        let url = URL(string: embedURLString)
        let request = URLRequest(url: url!)
        view.load(request)
        
        // Return WebView
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
