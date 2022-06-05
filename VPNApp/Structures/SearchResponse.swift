//
//  SearchResponse.swift
//  VPNApp
//
//  Created by Jafar on 31.05.2022.
//

import Foundation

struct SearchResponse: Codable {
    
    var error: Bool?
    var message: String?
    var result: [Country]?
}

struct Country: Codable {
    var id: Int?
    var image: String?
    var country: String?
    
}
