//
//  SpotifyHomeView.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import SwiftUI
import SwiftfulUI
struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil

    @State private var products: [Product] = []
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1,pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack {
                            recentSession
                            if let productFirst = products.first {
                                newReleaseSection(product: productFirst)
                            }
                            VStack(spacing :8) {
                                Text("Category title")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.spotifyWhite)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0..<20) { _ in
                                            ImageTitleRowCell()
                                        }
                                    }
                                    
                                }
                                .scrollIndicators(.hidden)
                            }
                        }
                        .padding(.horizontal, 16)
                    } header: {
                        header
                    }
                })
                .padding(.top , 8)
            }
            .scrollIndicators(.hidden)
            .clipped() // 滑动效果
        }
        .task {
             await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    
    private var header: some View {
        HStack {
            ZStack {
                if let currentUser = currentUser{
                    ImageLoaderView()
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35,height: 35)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach (Category.allCases , id: \.self) { s in
                        SpotifyCategoryCell(title: s.rawValue.capitalized, isSelected: s == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = s
                        }
                           
                        
                    }
                }
            }
        }
        .padding(.vertical,24)
        .padding(.leading,8)
        .background(.spotifyBlack)
        
    }
    
    
    
    func getData() async {
        do {
           currentUser =  try await DataBaseHelper().getUsers().first
            products = try await Array(DataBaseHelper().getProducts().prefix(8))
        } catch  {
            
        }
        
    }
    
    private var recentSession:  some View {
        NonLazyVGrid(columns: 2, alignment:.center ,spacing:  10 ,items: products) { product in
            if let product {
                SpotifyRecentsCell(imageName: product.firstImage,title:  product.title)
            }
        }
    }
    
    private func newReleaseSection(product :Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subHeadLine: product.brand,
            title: product.title,
            subtitle: product.description) {
                 
            } onPlayPressed: {
                 
            }
    }
}

#Preview {
    SpotifyHomeView()
}
