//
//  AuthRequestFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 17.01.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
