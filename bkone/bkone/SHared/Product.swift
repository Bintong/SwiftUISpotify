//
//  Product.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/25.
//

import Foundation
// MARK: - Product
struct Product: Codable,Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage : String {
        images.first ?? Constants.randomImage
    }
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
