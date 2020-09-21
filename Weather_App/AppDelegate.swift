//
//  AppDelegate.swift
//  Weather_App
//
//  Created by Theodora on 9/18/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
       
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {   
        Thread.sleep(forTimeInterval: 1.0)
        
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.61, green: 0.35, blue: 0.71, alpha: 1.00)
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.613045302, green: 0.7315297723, blue: 0.9180330634, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

