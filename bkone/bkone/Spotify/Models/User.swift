//
//  User.swift
//  bkone
//
//  Created by tongbin的macmini on 2024/4/25.
//

import Foundation

// MARK: - User
struct User: Codable,Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    
    let image: String
    let height: Int
    let weight: Double
    
    
    static var mock: User {
        User(id: 444, firstName: "Nick", lastName: "Sarno" , age: 76, email: "hi@hi.com", phone: "", username: "", password: "", image: Constants.randomImage, height: 180, weight: 200)
    }
     
    
 
}
