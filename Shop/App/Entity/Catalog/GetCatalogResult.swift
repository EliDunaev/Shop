//
//  GetCatalogResult.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation

struct GetCatalogResult: Codable {
    let pageNumber: Int
    let products: [Products]
}

struct Products: Codable {
    var productId: Int
    var productName: String
    var price: Int
}


