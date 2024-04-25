//
//  DataBaseHelper.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import Foundation


struct DataBaseHelper {
    func getProducts() async throws -> [Product ]{
        guard let url = URL(string: "https://dummyjson.com/products") else  {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
        
    }
    
    func getUsers() async throws -> [User]{
        guard let url = URL(string: "https://dummyjson.com/users") else  {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
        
    }
}



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}



// MARK: - Welcome
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

