//
//  ImageTitleRowCell.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/23.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize:CGFloat = 100
    var imageName :String = Constants.randomImage
    var title: String = "some item name "
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize,height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
            
        }
        .frame(width: imageSize)
             
    
    
    }
}

#Preview {
    ImageTitleRowCell()
}
