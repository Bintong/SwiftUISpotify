//
//  PlaylistHeaderCell.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/25.
//

import SwiftUI

 
struct PlaylistHeaderCell: View {
    
    var title: String = "some title of playlist here"
    var subtitle: String = "subtitle here"
    var imageName :String = ""
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: Constants.randomImage)
            }
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16.0)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0), shadowColor],
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
                ,alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: 300)
            .frame(height: 300)
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
    
}
