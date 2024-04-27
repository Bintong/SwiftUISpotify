//
//  SpotifyHomeView.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting
struct SpotifyHomeView: View {
    @Environment(\.router) var router

    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil

    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1,pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack {
                            recentSession
                                .padding(.horizontal, 16)
                            if let productFirst = products.first {
                                newReleaseSection(product: productFirst)
                                    .padding(.horizontal, 16)
                            }
                            
                          listrows
                            
                        
                        }
                      
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
                if let currentUser{
                    ImageLoaderView()
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
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
        guard products.isEmpty else {return}
        do {
           currentUser =  try await DataBaseHelper().getUsers().first
            products = try await Array(DataBaseHelper().getProducts().prefix(8))
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
//                let products = self.products.filter({$0.brand == brand})
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
            
        } catch  {
            
        }
        
    }
    
    private var recentSession:  some View {
        NonLazyVGrid(columns:  2, alignment:.center ,spacing:  10 ,items: products) { product in
            if let product {
                SpotifyRecentsCell(imageName: product.firstImage,title:  product.title)
                    .asButton(.press) {
                        //detail
                        gotoPlayListView(product: product)
                    }
            }
        }
    }
    
    private func gotoPlayListView(product:Product) {
        guard let currentUser else {return }
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product,user: currentUser)
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
                gotoPlayListView(product: product )

            }
    }
    
    private var listrows : some View {
        ForEach(productRows) {row in
            
            VStack(spacing :8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal, 16)
                ScrollView(.horizontal) {
                    HStack(alignment:.top, spacing: 16){
                        ForEach(row.products) { p in
                            ImageTitleRowCell(imageSize: 120  ,imageName: p.firstImage,title: p.title)
                        }
                    }
                    .padding(.horizontal, 16)

                    
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
    
}
