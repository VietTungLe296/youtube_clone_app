//
//  HomeView.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authenticationModel: AuthenticationViewModel
    @StateObject var model = VideoModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    authenticationModel.signOut()
                } label: {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            ScrollView {
                LazyVStack {
                    ForEach(model.videos, id: \.videoId) { video in
                        VideoRow(videoPreview: VideoPreview(video: video))
                            .padding()
                    }
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
        HomeView()
    }
}
