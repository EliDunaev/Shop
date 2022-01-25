//
//  AddReviewFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 25.01.2022.
//

import Foundation
import Alamofire

protocol AddReviewFactory {
    func addReview(userId: Int,
             text: String,
             completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
