//
//  SpotifyHomeViewModel.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/27.
//

import Foundation
import SwiftUI
import SwiftfulRouting

// add view model
@Observable
final class SpotifyHomeViewModel {
     
    let router : AnyRouter
    var currentUser: User? = nil
    var selectedCategory: Category? = nil
    var products: [Product] = []
    var productRows: [ProductRow] = []
    
    
    init(router: AnyRouter ) {
        self.router = router
        self.currentUser = currentUser
        self.selectedCategory = selectedCategory
        self.products = products
        self.productRows = productRows
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
}
