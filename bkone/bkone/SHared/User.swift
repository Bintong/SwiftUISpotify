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
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let domain, ip: String
    let macAddress, university: String
    let ein, ssn, userAgent: String
     
}
