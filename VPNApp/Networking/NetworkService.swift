//
//  NetworkService.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let topics = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(.success(topics))
                    
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
                
            }
        }.resume()
    
    }

    
}
