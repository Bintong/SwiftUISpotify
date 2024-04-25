//
//  SpotifyRecentsCell.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/21.
//

import SwiftUI

struct SpotifyRecentsCell: View {
     
    var imageName: String = Constants.randomImage
    var title: String = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55,height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
        }
        .padding(.trailing, 8 )
        .frame(maxWidth: .infinity,alignment: .leading)
        .themeColor(isSelected: false )
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
