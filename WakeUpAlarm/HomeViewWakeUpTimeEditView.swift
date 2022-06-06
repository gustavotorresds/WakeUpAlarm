//
//  HomeViewWakeUpTimeEditView.swift
//  WakeUpAlarm
//
//  Created by Arjun Mangla on 5/15/22.
//

import Foundation
import SwiftUI

struct HomeViewWakeUpTimeEditView: View {
    @ObservedObject var alarm: Alarm
    
    private var dateProxy: Binding<Date> {
        Binding<Date>(get: {alarm.getGlobalWakeUpTime()}, set: {
            alarm.setGlobalWakeUpTime(newWakeUpTime: $0)
        })
    }
    
    var body: some View {
        DatePicker("Wake Up Time", selection: dateProxy, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
    }
}

struct HomeViewWakeUpTimeEditView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWakeUpTimeEditView(alarm: Alarm.sampleAlarm)
    }
}
