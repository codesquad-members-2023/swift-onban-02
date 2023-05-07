//
//  Parser.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/28.
//

import Foundation

class Parser {
    
    func responseParse(jsonString: String) -> [Item] {
        guard let jsonString = jsonString.data(using: .utf8) else {
            return []
        }
        
        let jsonData = jsonString
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(Response.self, from: jsonData)
            return response.body
        } catch {
            print("Decode 실패 :", error.localizedDescription)
            return []
        }
    }

}
