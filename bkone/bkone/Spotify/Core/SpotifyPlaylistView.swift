//
//  SpotifyPlaylistView.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/25.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var body: some View {
        ImageLoaderView(urlString: Constants.randomImage)
            .frame(height: 300)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            SpotifyPlaylistView()
        }
        .ignoresSafeArea()
    }
    
}
