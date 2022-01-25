//
//  DeleteReviewFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation
import Alamofire

protocol DeleteReviewFactory {
    func deteteReview(commentId: Int,
             completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void)
}
