//
//  LocalNotificationView.swift
//  SwiftUI-notification
//
//  Created by Samet Çağrı Aktepe on 9.11.2023.
//

import SwiftUI

struct LocalNotificationView: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission") {
                NotificationManager.shared.requestPermission()
            }
            .buttonStyle(.bordered)
            
            Button("Schedule notification") {
                NotificationManager.shared.scheduleNotification()
            }
            .buttonStyle(.bordered)
        }
        .onAppear {
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    LocalNotificationView()
}
