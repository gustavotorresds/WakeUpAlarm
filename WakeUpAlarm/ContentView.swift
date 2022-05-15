//
//  ContentView.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/5/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var data: AlarmProps.AlarmPropsData
    var body: some View {
        TabView {
            HomeView(data: $data)
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
        ContentView(data: .constant(AlarmProps.AlarmPropsData()))
    }
}
