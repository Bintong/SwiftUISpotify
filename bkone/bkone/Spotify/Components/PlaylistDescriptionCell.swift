//
//  PlaylistDescriptionCell.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/26.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    var descriptionText: String = Product.mock.description
    var userName: String = "Nick"
    var subheadeline : String = "Some headline goes here"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
 
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity,alignment: .leading)
           
            madeforyouSession
            Text(subheadeline)
            buttonsRow
               
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeforyouSession: some View {
        HStack(spacing:8){
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("Made for")
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var buttonsRow: some View {
        HStack {
            HStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(systemName: "plus.circle")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    Image(systemName: "arrow.down.circle")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    Image(systemName: "square.and.arrow.up")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    
                }
                .offset(x: -8)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
     
     
            HStack(spacing:8) {
                Image(systemName: "shuffle")
                     
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .foregroundColor(.spotifyGreen)
        }
    }
}

#Preview {
    PlaylistDescriptionCell()
}
