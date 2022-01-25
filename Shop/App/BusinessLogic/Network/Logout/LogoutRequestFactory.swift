//
//  LogoutRequestFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 17.01.2022.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
