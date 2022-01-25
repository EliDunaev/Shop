//
//  GetCatalog.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation
import Alamofire

class GetCatalog: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://intense-sierra-18075.herokuapp.com")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GetCatalog: GetCatalogRequestFactory {
    func get(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<GetCatalogResult>) -> Void) {
        let requestModel = getCatalog(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetCatalog {
    struct getCatalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getCatalog"
    
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "idCategory": categoryId,
                "pageNumber": pageNumber
            ]
        }
    }
}
