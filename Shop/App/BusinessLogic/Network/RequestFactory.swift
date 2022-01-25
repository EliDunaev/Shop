//
//  RequestFactory.swift
//  Shop
//
//  Created by Илья Дунаев on 17.01.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFatory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeInfoRequestFatory() -> ChangeInfoRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetCatalogData() -> GetCatalogRequestFactory {
        let errorParser = makeErrorParser()
        return GetCatalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddReview() -> AddReviewFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeDeleteReview() -> DeleteReviewFactory {
        let errorParser = makeErrorParser()
        return DeleteReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

