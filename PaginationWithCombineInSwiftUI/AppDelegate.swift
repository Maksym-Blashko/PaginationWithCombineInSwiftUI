//
//  AppDelegate.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 16.03.2023.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        ForceUpdater.checkAppVersionAndUpdateIfNeeded(with: window)
        return true
    }
}
