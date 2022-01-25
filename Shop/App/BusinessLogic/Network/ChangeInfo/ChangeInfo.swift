//
//  ChangeInfo.swift
//  Shop
//
//  Created by Илья Дунаев on 18.01.2022.
//

import Foundation
import Alamofire

class ChangeInfo: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://127.0.0.1:8080")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeInfo: ChangeInfoRequestFactory {
    func register(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeInfoResult>) -> Void) {
        let requestModel = EditData(baseUrl: baseUrl, userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeInfo {
    struct EditData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "edit"
    
        let userId: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user" : userId,
                "username" : userName,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}
