//
//  LoginView.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    @EnvironmentObject var authenticationModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("fake_tube")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("Youtube Fake!")
                .fontWeight(.black)
                .foregroundColor(Color(.systemIndigo))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Text("A sample app that has MCK's 99% album")
                .font(.headline)
                .multilineTextAlignment(.center)
                .italic()
                .padding()
            
            Text("Please sign in to continue")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.top)
                .bold()
            
            GoogleSignInButton(action: {
                authenticationModel.signIn()
            })
            .padding()
            
            Spacer()
        }
        .padding()
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
