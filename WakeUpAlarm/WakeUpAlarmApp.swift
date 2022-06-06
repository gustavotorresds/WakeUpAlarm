//
//  WakeUpAlarmApp.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/5/22.
//

import SwiftUI

@main
struct WakeUpAlarmApp: App {
    @StateObject private var alarm = Alarm()
    
    var body: some Scene {
        WindowGroup {
            ContentView(alarm: alarm)
        }
    }
}

