//
//  SpotifyPlaylistView.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router

    var product: Product = .mock
    
    var user: User = .mock
    @State var offset: CGFloat = 0
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false

    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing:12) {
                    PlaylistHeaderCell(title: product.title,
                                       subtitle: product.brand,
                                       imageName: product.thumbnail )
                    
                    .readingFrame { frame in
                        offset = frame.maxY
                        showHeader = frame.maxY < 150 ? true : false
                    }
                    
                    
                    PlaylistDescriptionCell(descriptionText: product.description,
                                            userName: user.username,
                                            subheadeline: product.category) {
                        
                    } onDownloadPressed: {
                        
                    } onSharePressed: {
                        
                    } onEllipsisPressed: {
                        
                    } onShufflePressed: {
                        
                    } onPlayPressed: {
                            
                    }
                    .padding(.horizontal,16)
                    ForEach(products) {product in
                        SongRowCell(imageSize: 100, 
                                    imageName: product.firstImage,
                                    title: product.title,
                                    subtitle: product.brand,
                                    onCellPress:{
                                        gotoPlayListView(product: product)
                                        
                                    }, onEllipsisPressed: {
                            
                                    })

                    }
                    
            
                }
            }
            .scrollIndicators(.hidden)
            
            header
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func getData() async {
        do {
            products = try await  DataBaseHelper().getProducts()
        } catch  {
            
        }
    }
    
    private func gotoPlayListView(product:Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product,user: user )
        }
    }
    
    private var header: some View {
        
        ZStack {
            Text(product.title)
                .font(.headline)
                .foregroundStyle(.spotifyWhite)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ?  1 : 0)
                
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.spotifyGary.opacity(0.001) :   Color.spotifyGary.opacity(0.7))
                 
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
                .onTapGesture {
                    router.dismissScreenStack()
                }
                .padding(.leading,16)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2),value: showHeader)
        
    }
}

#Preview {
    RouterView {_ in 
        SpotifyPlaylistView()
    }
}
