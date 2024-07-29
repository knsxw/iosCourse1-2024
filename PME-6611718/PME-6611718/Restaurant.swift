//
//  Restaurant.swift
//  PME-6611718
//
//  Created by Sasori on 27/7/2567 BE.
//

import Foundation

struct Restaurant: Codable {
    let name: String
    let location: String
    let description: String
    let rating: Double
    let openingTime: String
    let price: String
    let images: [String]
}

struct Root: Codable {
    let items: [Restaurant]
}
