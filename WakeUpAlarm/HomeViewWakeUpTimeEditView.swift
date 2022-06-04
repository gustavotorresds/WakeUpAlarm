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
    var body: some View {
        DatePicker("Wake Up Time", selection: $alarm.data.finalWakeUpTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
    }
}

struct HomeViewWakeUpTimeEditView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWakeUpTimeEditView(alarm: Alarm.sampleAlarm)
    }
}
