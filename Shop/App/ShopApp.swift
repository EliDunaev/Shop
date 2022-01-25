//
//  ShopApp.swift
//  Shop
//
//  Created by Илья Дунаев on 04.01.2022.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let testRequest = TestApiRequests()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        testRequest.testAuth()
        testRequest.testLogout()
        testRequest.testRegistration()
        testRequest.testDataChange()
        testRequest.getCatalogData()
        testRequest.addReview()
        testRequest.deteteReview()
        
        return true
    }
    
}

@main
struct ShopApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
        }
    }
}
