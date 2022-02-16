//
//  AppDelegate.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import UIKit
import InAppSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize SDK. Always do it once before application start.
        InApp.shared.start()
        
        // Enabling additional logging for debug.
        InApp.shared.isDebugLoggingEnabled = true
        
        // We registered our views to work with them in dashboard after.
//        InApp.shared.registerScreens(screens: [
//            InAppScreen(key: InAppConfiguration.Views.banner, title: InAppConfiguration.Views.banner),
//            InAppScreen(key: InAppConfiguration.Views.interstitial, title: InAppConfiguration.Views.interstitial),
//            InAppScreen(key: InAppConfiguration.Views.rewarded, title: InAppConfiguration.Views.rewarded),
//            InAppScreen(key: InAppConfiguration.Views.native, title: InAppConfiguration.Views.native),
//        ])
        
        // Initialize view tree hierarchy.
        let adsListViewController = AdsListViewController()
        let mainNavigationController = UINavigationController(rootViewController: adsListViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
