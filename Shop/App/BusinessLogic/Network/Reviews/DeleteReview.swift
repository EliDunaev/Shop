//
//  DeleteReview.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation
import Alamofire

class DeleteReview: AbstractRequestFactory {
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

extension DeleteReview: DeleteReviewFactory {
    func deteteReview(commentId: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void) {
        let requestModel = DeleteReview(baseUrl: baseUrl, commentId: commentId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteReview {
    struct DeleteReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "deleteReview"
    
        let commentId: Int
        var parameters: Parameters? {
            return [
                "commentId": commentId,
            ]
        }
    }
}
