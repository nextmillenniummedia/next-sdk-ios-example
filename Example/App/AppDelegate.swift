//
//  AppDelegate.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import UIKit
import NextSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize SDK. Always do it once before application start.
        Next.shared.configure(
            byAPIKey:"6285d909-0033-4ebc-9926-91e14c8e2a2f",
            onTestMode: true
        )
        
        // Enabling additional logging for debug.
        Next.shared.logLevel = .debug
        
        // Initialize view tree hierarchy.
        let adsListViewController = AdsListViewController()
        let mainNavigationController = UINavigationController(rootViewController: adsListViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
