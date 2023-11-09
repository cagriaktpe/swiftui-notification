//
//  NotificationManage.swift
//  SwiftUI-notification
//
//  Created by Samet Çağrı Aktepe on 9.11.2023.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager() // Singleton
    
    func requestPermission() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Permission granted: \(success)")
            }
        }
    }
    
    func scheduleNotification() {
        
    }
    
    func removeNotification() {
        
    }
    
}
