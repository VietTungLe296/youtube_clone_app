//
//  YoutubeCloneApp.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import SwiftUI
import Firebase

@main
struct YoutubeCloneApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            EntryView()
                .environmentObject(viewModel)
        }
    }
}

extension YoutubeCloneApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
