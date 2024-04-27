//
//  ContentView.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import SwiftUI
import SwiftfulRouting
import SwiftfulUI

struct ContentView: View {
     
    @Environment(\.router) var router
    
    var body: some View {
        List{
            Button("open spotify" ) {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                    
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
    
}
