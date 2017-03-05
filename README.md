# UserNotifications Framework

## 概要
UserNotificationsは、Local通知・Remote通知の配信や処理をするためのフレームワークです。<br>時間や場所などを条件にLocal通知の配信予約をすることができます。

## クラス
[UNCalendarNotificationTrigger Class](https://github.com/stv-yokudera/ios-usernotifications-demo#uncalendarnotificationtrigger)<br>
[UNMutableNotificationContent Class](https://github.com/stv-yokudera/ios-usernotifications-demo#unmutablenotificationcontent)<br>
[UNNotificationRequest Class](https://github.com/stv-yokudera/ios-usernotifications-demo#unnotificationrequest)<br>
[UNNotificationSettings Class](https://github.com/stv-yokudera/ios-usernotifications-demo#unnotificationsettings)<br>
[UNNotificationSound Class](https://github.com/stv-yokudera/ios-usernotifications-demo#unnotificationsound)<br>
[UNTimeIntervalNotificationTrigger Class](https://github.com/stv-yokudera/ios-usernotifications-demo#untimeintervalnotificationtrigger)<br>
[UNUserNotificationCenter Class](https://github.com/stv-yokudera/ios-usernotifications-demo#unusernotificationcenter)

## 開発環境

| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |
## 参考
https://developer.apple.com/reference/usernotifications

<hr>

# UNCalendarNotificationTrigger

## 概要
UNCalendarNotificationTriggerは、指定した日時に通知を配信するクラスです。

## 関連クラス
UNNotificationTrigger

## イニシャライザ

| イニシャライザ | 説明 | サンプル |
|:-----------|:------------|:------------|
| init(dateMatching:repeats:) | 指定したdateComponentsからカレンダートリガーを作成する | UNCalendarNotificationTrigger.init(dateMatching: dateComponents, repeats: false) |

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|:-----------|:------------|:------------|
| dateComponents | dateComponents | trigger.dateComponents |

## 参考
https://developer.apple.com/reference/usernotifications/uncalendarnotificationtrigger

<hr>

# UNMutableNotificationContent

## 概要
UNMutableNotificationContentは、編集可能な通知コンテンツを提供するクラスです。

## 関連クラス
UNNotificationContent

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|:-----------|:------------|:------------|
| title | 通知のタイトル | content.title = "title" |
| subtitle | 通知のサブタイトル | content.subtitle = "subtitle" |
| body | 通知のメッセージ | content.body = "body" |
| sound | 通知音 | content.sound = customSound ?? .default() |

## 参考
https://developer.apple.com/reference/usernotifications/unmutablenotificationcontent

<hr>

# UNNotificationRequest

## 概要
UNNotificationRequestは、通知コンテンツとその配信のトリガーを指定して通知を要求するクラスです。

## 関連クラス
NSObject

## イニシャライザ

| イニシャライザ | 説明 | サンプル |
|:-----------|:------------|:------------|
| init(identifier:content:trigger:) | ローカル通知要求オブジェクトを作成する | UNNotificationRequest(identifier: "aNotification", content: content, trigger: trigger) |

## 参考
https://developer.apple.com/reference/usernotifications/unnotificationrequest

<hr>

# UNNotificationSettings

## 概要
UNNotificationSettingsは、アプリの通知の設定と承認ステータスを管理するクラスです。

## 関連クラス
NSObject

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|:-----------|:------------|:------------|
| authorizationStatus | 承認ステータスを取得する | settings.authorizationStatus |
| notificationCenterSetting | 通知が通知センターに表示されるかどうかの設定 | settings.notificationCenterSetting |
| lockScreenSetting | デバイスロック時に通知が画面に表示されるかどうかの設定 | settings.lockScreenSetting |
| alertStyle | 通知の種類を取得する | settings.alertStyle |
| badgeSetting | アプリのアイコンのバッジを作成するための承認ステータスを取得する | settings.badgeSetting |
| soundSetting | 通知のサウンドを再生するための承認ステータスを取得する | settings.soundSetting |

## 参考
https://developer.apple.com/reference/usernotifications/unnotificationsettings

<hr>

# UNNotificationSound

## 概要
UNNotificationSoundは、通知が配信されたときに再生されるサウンドを設定するクラスです。

## 関連クラス
NSObject

## イニシャライザ

| イニシャライザ | 説明 | サンプル |
|:-----------|:------------|:------------|
| init(named:) | 指定したサウンドファイルを再生する通知サウンドオブジェクトを作成する | UNNotificationSound.init(named: "Alarm.mp3") |

## 主要メソッド

| メソッド名 | 説明 | サンプル |
|:-----------|:------------|:------------|
| default() | 通知のデフォルトサウンドを表すオブジェクトを返す| content.sound = .default() |


## 参考
https://developer.apple.com/reference/usernotifications/unnotificationsound

<hr>

# UNTimeIntervalNotificationTrigger

## 概要
UNTimeIntervalNotificationTriggerは、指定した時間が経過すると通知を配信するクラスです。

## 関連クラス
UNNotificationTrigger

## イニシャライザ

| イニシャライザ | 説明 | サンプル |
|:-----------|:------------|:------------|
| init(timeInterval:repeats:) | 指定した時間値からタイムインターバルトリガーを作成する | UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true) |

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|:-----------|:------------|:------------|
| timeInterval | タイムインターバル | trigger.timeInterval |

## 参考
https://developer.apple.com/reference/usernotifications/untimeintervalnotificationtrigger

<hr>

# UNUserNotificationCenter

## 概要
UNUserNotificationCenterは、アプリの通知機能を管理するクラスです。

## 関連クラス
NSObject

## 主要プロパティ

|プロパティ名|説明|サンプル|
|---|---|---|
|delegate | delegateを指定する <br>UNUserNotificationCenterDelegateを利用するため | userNotificationCenter.delegate = self |

## 主要メソッド

|メソッド名|説明|サンプル|
|---|---|---|
|current() | シングルトンユーザー通知センターオブジェクトを取得する | UNUserNotificationCenter.current() |
|requestAuthorization(options:completionHandler:) | 通知使用の許可を要求する | userNotificationCenter.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in |
|getNotificationSettings(completionHandler:) | 通知設定を取得する| userNotificationCenter.getNotificationSettings(completionHandler: { (settings) in |
|add(_:withCompletionHandler:)|ローカル通知を配信するためのスケジュールを追加する|userNotificationCenter.add(request, withCompletionHandler: nil)|
|removeAllPendingNotificationRequests() | 未配信の通知要求を削除する | userNotificationCenter.removeAllPendingNotificationRequests() |

### UNUserNotificationCenterDelegateプロトコルのメソッド

|メソッド名|説明|必須|
|---|---|---|
|userNotificationCenter(_:willPresent:withCompletionHandler:) | フォアグラウンドのアプリに通知が送信されたときに呼び出される | - |
|userNotificationCenter(_:didReceive:withCompletionHandler:) | 通知がタップされて開かれたときに呼び出される | - |

## 参考
https://developer.apple.com/reference/usernotifications/unusernotificationcenter
