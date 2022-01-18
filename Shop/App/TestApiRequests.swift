//
//  TestApiRequests.swift
//  Shop
//
//  Created by Илья Дунаев on 18.01.2022.
//

import Foundation

struct TestApiRequests {
    
    let requestFactory = RequestFactory()
    
    func testAuth() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func testLogout() {
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func testRegistration() {
        let create = requestFactory.makeRegistrationRequestFatory()
        create.register(userId: 123, userName: "user", password: "123", email: "1@2.com", gender: "M", creditCard: "1234 5567 7765 7788", bio: "1101") { response in
            switch response.result {
            case .success(let createAcc):
                print(createAcc)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func testDataChange() {
        let change = requestFactory.makeChangeInfoRequestFatory()
        change.register(userId: 123, userName: "user", password: "123", email: "1@2.com", gender: "M", creditCard: "1234 5567 7765 7788", bio: "1101") { response in
            switch response.result {
            case .success(let changeData):
                print(changeData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
