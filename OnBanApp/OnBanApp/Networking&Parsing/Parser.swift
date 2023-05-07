//
//  Parser.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/28.
//

import Foundation

struct Parser {
    func responseParse(jsonString: String) {
        guard let jsonString = jsonString.data(using: .utf8) else {
            return
        }
        
        let jsonData = jsonString
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(Response.self, from: jsonData)
        
        } catch {
            print("Decode 실패 :", error.localizedDescription)
        }
    }
    
    private func itemParse(items: [Item]) {
        for item in items {
            print("Hash: \(item.detail_hash)")
            print("Image: \(item.image)")
            print("alt: \(item.alt)")
            print("Delivery types: \(item.delivery_type)")
            print("Title: \(item.title)")
            print("Description: \(item.description)")
            print("SPrice: \(item.s_price)")
            print("NPrice: \(item.n_price ?? "")")
            print("Badge: \(item.badge ?? [])")
        }
    }

}
