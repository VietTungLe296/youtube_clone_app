//
//  EntryView.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 05/07/2023.
//

import SwiftUI

struct EntryView: View {
  @EnvironmentObject var authenticationModel: AuthenticationViewModel
  
  var body: some View {
    switch authenticationModel.state {
      case .signedIn: HomeView()
      case .signedOut: LoginView()
    }
  }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
