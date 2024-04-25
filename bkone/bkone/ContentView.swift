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
    
    @State private var users : [User] = []
    @State private var products : [Product] = []
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { pro in
                    Text(pro.title)
                        .foregroundStyle(.spotifyGreen)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    
    private func getData() async {
        do {
            users = try  await DataBaseHelper().getUsers()
            products  = try  await DataBaseHelper().getProducts()
        } catch  {
            
        }
    }
}

#Preview {
    ContentView()
}
