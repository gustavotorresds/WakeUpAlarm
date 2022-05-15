//
//  WakeUpAlarmApp.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/5/22.
//

import SwiftUI

@main
struct WakeUpAlarmApp: App {
    @State private var data = AlarmProps.AlarmPropsData()
    var body: some Scene {
        WindowGroup {
            ContentView(data: $data)
        }
    }
}
