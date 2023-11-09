//
//  NotificationManage.swift
//  SwiftUI-notification
//
//  Created by Samet Çağrı Aktepe on 9.11.2023.
//

import Foundation
import UserNotifications
import CoreLocation

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
        
        // trigger
        // time
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // calendar
        // var dateComponents = DateComponents()
        // dateComponents.hour = 10
        // dateComponents.minute = 55
        
        let coordinates = CLLocationCoordinate2D(latitude: 37.33182,
                                                longitude: -122.03118)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
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
