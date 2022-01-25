//
//  AddReview.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {
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

extension AddReview: AddReviewFactory {
    func addReview(userId: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userId: userId, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReview {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
    
        let userId: Int
        let text: String
        var parameters: Parameters? {
            return [
                "userId": userId,
                "text": text
            ]
        }
    }
}
