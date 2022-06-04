//
//  ContentView.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/5/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var alarm: Alarm
    
    var body: some View {
        TabView {
            HomeView(alarm: alarm)
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            SettingsView()
                .tabItem() {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(alarm: Alarm.sampleAlarm)
    }
}
