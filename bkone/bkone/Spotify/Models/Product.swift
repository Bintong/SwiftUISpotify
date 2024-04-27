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
    static var mock : Product {
        Product(id: 123, title: "Em title",
                description: "Em mock ",
                price: 99,
                discountPercentage: 15,
                rating: 4.5,
                stock:50 ,
                brand: "Apple",
                category: "Elee",
                thumbnail: Constants.randomImage,
                images: [Constants.randomImage,Constants.randomImage,Constants.randomImage,])
    }
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
