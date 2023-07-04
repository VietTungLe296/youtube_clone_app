//
//  TestView.swift
//  YoutubeClone
//
//  Created by Le Viet Tung on 04/07/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        if let token = Constants.API_KEY {
            // Use the API token in your app
            Text("API Token: \(token)")
        } else {
            // Handle the case when the API token is not available
            Text("API Token is not available.")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
