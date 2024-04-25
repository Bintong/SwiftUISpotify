//
//  SpotifyNewReleaseCell.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/21.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName : String = Constants.randomImage
    var headline: String? = "New Relases from"
    var subHeadLine: String? = "Some Artist"
    var title:String? = "Some PlayList"
    var subtitle: String? = "Single - title"
    
    var onAddToPlayListPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil

    var body: some View {
        VStack (spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, content: {
                    if  let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subHeadLine {
                        Text(subHeadLine)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                            
                    }
                })
                 
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140,height: 140)
                VStack (alignment: .leading, spacing: 30, content: {
                    VStack (alignment:.leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle {
                            Text(subtitle   )
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .onTapGesture {
                                onAddToPlayListPressed?()
                            }
                            .offset(x:-4)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                           
                     }
                })
                .padding(.trailing, 16)
                
                
               
            }
            .themeColor(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }

        }
         
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
    
}
