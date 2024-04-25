//
//  ImageLoaderView.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
    var resizingModel: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingModel)
                    .allowsHitTesting(false)
            )
            .clipped()
      
        
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical,60)
}
