//
//  VideoRow.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI

struct VideoRow: View {
    @ObservedObject var videoPreview: VideoPreview
    @State private var isPresenting = false
    @State private var imageHeight: CGFloat = 0
    
    var body: some View {
        Button {
            isPresenting = true
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                GeometryReader { proxy in
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.width * 9 / 16)
                        .clipped()
                        .onAppear {
                            imageHeight = proxy.size.width * 9 / 16
                        }
                }
                .frame(height: imageHeight)
                
                Text(videoPreview.title)
                    .bold()
                
                Text(videoPreview.date)
                    .foregroundColor(.gray)
            }
            .font(.system(size: 19))
        }
        .sheet(isPresented: $isPresenting) {
            VideoDetail(video: videoPreview.video)
        }
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
