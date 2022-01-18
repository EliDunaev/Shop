//
//  ChangeInfoRequestFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 18.01.2022.
//

import Foundation
import Alamofire

protocol ChangeInfoRequestFactory {
    func register(userId: Int,
                  userName: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<ChangeInfoResult>) -> Void)
}
