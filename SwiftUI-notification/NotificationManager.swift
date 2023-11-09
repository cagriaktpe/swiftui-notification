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
        // content
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.subtitle = "Notification Subtitle"
        content.sound = .default
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // identifier
        let identifier = UUID().uuidString
        
        // request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // schedule
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Notification scheduled")
            }
        }
    }
    
    func removeNotification() {
        
    }
    
}
