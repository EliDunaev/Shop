//
//  GetCatalogRequestFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation
import Alamofire

protocol GetCatalogRequestFactory {
    func get(pageNumber: Int,
                  categoryId: Int,
                  completionHandler: @escaping (AFDataResponse<GetCatalogResult>) -> Void)
}
