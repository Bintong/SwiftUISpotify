//
//  PlaylistHeaderCell.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/25.
//

import SwiftUI

 
struct PlaylistHeaderCell: View {
    
    var title: String = ""
    var  subtitle: String = ""
    var imageName :String = ""
    var body: some View {
        
        ImageLoaderView(urlString: Constants.randomImage)
            .overlay(
                Vstak
            )
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
