//
//  Food.swift
//  OnBanApp
//
//  Created by SONG on 2023/05/07.
//

import Foundation

struct Response: Codable {
    let statusCode: Int
    let body: [Item]
}

struct Item: Codable {
    let detail_hash: String
    let image: String
    let alt: String
    let delivery_type: [String]
    let title: String
    let description: String
    let n_price: String?
    let s_price: String
    let badge: [String]?
}

class Food {
    private(set) var Foods: [Item] = []
    
    func fetch(items: [Item]) {
        let connection = HTTPRequestHandler()
        connection.MainDishInfo()
    }
}
