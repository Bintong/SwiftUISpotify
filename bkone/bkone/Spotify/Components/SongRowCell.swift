//
//  SongRowCell.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/26.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageSize : CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "song title"
    var subtitle : String? = "some sub titleome sub titleome sub titleome sub titleome sub titleome sub titleome sub titleome sub title"
    var onCellPress: (()->Void)? = nil
    var onEllipsisPressed: (()->Void)? = nil
 
    var body: some View {
        HStack(spacing: 8.0) {
            ImageLoaderView(urlString: imageName )
                .frame(width: imageSize,height: imageSize)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color("SpotifyWhite"))
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundColor(Color("SpotifyLightGray"))
                     
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Image(systemName:"ellipsis")
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(.black.opacity(0.001))
        .onTapGesture {
            onCellPress?()
        }
            
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
    
}
