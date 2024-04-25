//
//  SpotifyCategoryCell.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "xx"
    var isSelected: Bool = false
    
    var body: some View {
         Text(title)
            .font(.callout)
            .frame(minWidth: 34)
            .padding(EdgeInsets(top: 8,leading: 10,bottom: 8,trailing: 10))
            .themeColor(isSelected: isSelected)
            .cornerRadius(16)
        
            
    }
}

extension View {
    func themeColor(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundColor(isSelected ? .spotifyBlack : .spotifyWhite)    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SpotifyCategoryCell(title: "Music",isSelected: true)
            SpotifyCategoryCell(title: "xx News",isSelected: false)
            SpotifyCategoryCell()
        }
    }
    
}
