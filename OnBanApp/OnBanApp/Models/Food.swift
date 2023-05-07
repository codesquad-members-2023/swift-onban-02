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
    private(set) var mainFoods: [Item] = []
    
    func fetchParsedJson() {
        let connection = HTTPRequestHandler()
        connection.mainDishInfo { result in
            switch result {
            case .success(let jsonString):
                let parseTest = Parser()
                self.mainFoods = parseTest.responseParse(jsonString: jsonString)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
}
