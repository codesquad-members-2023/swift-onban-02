//
//  HTTPRequest.swift
//  OnBanApp
//
//  Created by SONG on 2023/04/27.
//

import Foundation

struct HTTPRequestHandler {
    
    func mainDishInfo(completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://api.codesquad.kr/onban/main") else {
            return
        }
        let request = URLRequest(url: url, timeoutInterval: 3.0)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200,
               let data = data,
               let info = String(data: data, encoding: .utf8) {
                completion(.success(info))
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()

    }
}
