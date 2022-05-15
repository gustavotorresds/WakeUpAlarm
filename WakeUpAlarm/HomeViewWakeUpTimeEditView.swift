//
//  HomeViewWakeUpTimeEditView.swift
//  WakeUpAlarm
//
//  Created by Arjun Mangla on 5/15/22.
//

import Foundation
import SwiftUI

struct HomeViewWakeUpTimeEditView: View {
    @Binding var wakeUpTime: Date
    var body: some View {
        DatePicker("Wake Up Time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
    }
}

struct HomeViewWakeUpTimeEditView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWakeUpTimeEditView(wakeUpTime: .constant(Date()))
    }
}
