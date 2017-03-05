//
//  ViewController.swift
//  ios-usernotifications-demo
//
//  Created by OkuderaYuki on 2017/02/28.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var userNotificationCenter: UNUserNotificationCenter?

    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserNotifications()
        getNotificationSettings()
    }
    
    private func setupUserNotifications() {
        userNotificationCenter = UNUserNotificationCenter.current()
    }
    
    /// 通知設定の情報を取得する
    private func getNotificationSettings() {
        userNotificationCenter?.getNotificationSettings(completionHandler: { (settings) in
            
            switch settings.authorizationStatus {
            case .authorized:
                // 選択されていない
                print("authorizationStatus: authorized")
                break
            case .denied:
                // 拒否
                print("authorizationStatus: denied")
                break
            case .notDetermined:
                // 許可
                print("authorizationStatus: notDetermined")
                break
            }
            
            switch settings.notificationCenterSetting {
            case .notSupported:
                // サポートしていない
                print("notificationCenterSetting: notSupported")
                break
            case .disabled:
                // 通知センターに表示がOFF
                print("notificationCenterSetting: disabled")
                break
            case .enabled:
                // 通知センターに表示がON
                print("notificationCenterSetting: enabled")
                break
            }
            
            switch settings.badgeSetting {
            case .notSupported:
                // サポートしていない
                print("badgeSetting: notSupported")
                break
            case .disabled:
                // Appアイコンにバッジを表示がOFF
                print("badgeSetting: disabled")
                break
            case .enabled:
                // Appアイコンにバッジを表示がON
                print("badgeSetting: enabled")
                break
            }
            
            switch settings.lockScreenSetting {
            case .notSupported:
                // サポートしていない
                print("lockScreenSetting: notSupported")
                break
            case .disabled:
                // ロック画面に表示がOFF
                print("lockScreenSetting: disabled")
                break
            case .enabled:
                // ロック画面に表示がON
                print("lockScreenSetting: enabled")
                break
            }
            
            switch settings.alertStyle {
            case .none:
                // なし
                print("alertStyle: none")
                break
            case .banner:
                // バナー
                print("alertStyle: banner")
                break
            case .alert:
                // アラート
                print("alertStyle: alert")
                break
            }
            
            switch settings.soundSetting {
            case .notSupported:
                // サポートしていない
                print("soundSetting: notSupported")
                break
            case .disabled:
                // サウンドOFF
                print("soundSetting: disabled")
                break
            case .enabled:
                // サウンドON
                print("soundSetting: enabled")
                break
            }
        })
    }
    
    //MARK:- Create notification requests
    
    /// ローカル通知のリクエストを作成する
    private func requestTimeIntervalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "body"
        
        // 3秒後に通知する
        // repeatsをtrueにする場合は、timeIntervalを60秒以上に設定しなければならない
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "aNotification",
                                            content: content,
                                            trigger: trigger)
        
        // 通知の予約をする
        userNotificationCenter?.add(request, withCompletionHandler: nil)
    }
    
    /// ローカル通知のリクエストを作成する(リピート有)
    private func requestTimeIntervalNotificationRepeats(customSound: UNNotificationSound?) {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "body"
        
        // サウンド付き customSoundがnilだったらデフォルトの通知音を使用する
        content.sound = customSound ?? .default()
        
        // 60秒後に通知する(リピート有)
        // repeatsをtrueにする場合は、timeIntervalを60秒以上に設定しなければならない
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "bNotification",
                                            content: content,
                                            trigger: trigger)
        
        // 通知の予約をする
        userNotificationCenter?.add(request, withCompletionHandler: nil)
    }
    
    /// 日時を指定してローカル通知のリクエストを作成する
    private func requestCalendarNotification(dateComponents: DateComponents) {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "body"
        content.sound = .default()
        
        // 指定日時に通知する
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComponents, repeats: false)
        print("dateComponents: \(trigger.dateComponents)")
        let request = UNNotificationRequest.init(identifier: "cNotification",
                                                 content: content,
                                                 trigger: trigger)
        
        // 通知の予約をする
        userNotificationCenter?.add(request, withCompletionHandler: nil)
    }
    
    //MARK:- Cancel notification requests
    
    /// 送信待ちの全ての通知を削除する
    private func cancelAllNotifications() {
        userNotificationCenter?.removeAllPendingNotificationRequests()
    }
    
    //MARK:- IBActions
    
    /// 3秒経過したらローカル通知を送るボタン
    @IBAction func tappedTimeIntervalNotification(_ sender: Any) {
        requestTimeIntervalNotification()
    }
    
    /// 60秒経過したらローカル通知を送るボタン(リピート有)
    @IBAction func tappedTimeIntervalNotificationRepeats(_ sender: Any) {
        // 通知音を変更する
        let sound: UNNotificationSound? = UNNotificationSound.init(named: "Alarm.mp3")
        requestTimeIntervalNotificationRepeats(customSound: sound)
    }
    
    /// 指定日時にローカル通知を送るボタン
    @IBAction func tappedCalendarNotification(_ sender: Any) {
        // 通知する日時を設定する
        let dateComponents = DateComponents.init(year: 2017, month: 3, day: 6, hour: 1, minute: 49)
        requestCalendarNotification(dateComponents: dateComponents)
    }
    
    /// 送信待ちの全ての通知を削除するボタン
    @IBAction func tappedCancel(_ sender: Any) {
        cancelAllNotifications()
    }
}
