//
//  AppDelegate.swift
//  ios-usernotifications-demo
//
//  Created by OkuderaYuki on 2017/02/28.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 10.0, *) {
            // iOS 10
            let userNotificationCenter = UNUserNotificationCenter.current()
            userNotificationCenter.delegate = self
            userNotificationCenter.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                
                if let error = error {
                    print("\(error.localizedDescription)")
                    return
                }
                
                if granted {
                    print("通知許可")
                } else {
                    print("通知拒否")
                }
            })
            
        } else {
            // iOS 9
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.badge, .sound, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void)
    {
        completionHandler()
    }
}
