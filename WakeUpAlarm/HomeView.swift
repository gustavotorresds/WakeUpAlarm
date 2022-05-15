//
//  HomeView.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/5/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var isPresentingWakeUpTimeEditView = false
    @Binding var data: AlarmProps.AlarmPropsData
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Wake-up Alarm")
                .font(.system(size: 48).bold())
                .padding(.bottom)
            
            // Visual indication of current wake up time and time altering
            // Note: currently edit functionality here globally alters wake up time
            Text("Tomorrow I will")
                .font(.system(size: 32))
            HStack {
                Text("wake up at")
                    .font(.system(size: 32))
                Button(action: {isPresentingWakeUpTimeEditView = true}) {
                    Text(dateToString(date: data.finalWakeUpTime))
                        .foregroundColor(.black)
                        .font(.system(size: 32).bold())
                        .underline()
                }
            }
            
            //Small font message for start and interval
            let totalAlarmDuration = Double(data.timeIntervalLength)*Double(data.alarmFrequency)
            let alarmStartTime = Calendar.current.date(byAdding: .minute, value: -Int(totalAlarmDuration), to: data.finalWakeUpTime)!
            let alarmStartTimeString = dateToString(date: alarmStartTime)
            Text("Alarms will ring every \(Int(data.timeIntervalLength)) min starting at \(alarmStartTimeString)")
            
            // empty button for switching off alarms
            Button(action: {}) {
                Text("Switch off today's alarms")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .font(.headline)
                    .padding(20)
            }
            .clipShape(Capsule())
            .background(.green)
        }
        
        //functionality for bringing up wake up time edit view
        .sheet(isPresented: $isPresentingWakeUpTimeEditView) {
            NavigationView {
                HomeViewWakeUpTimeEditView(wakeUpTime: $data.finalWakeUpTime)
                    .navigationTitle("Edit Wake Up Time")
                    .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isPresentingWakeUpTimeEditView = false
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        isPresentingWakeUpTimeEditView = false
                                    }
                                }
                            }
            }
        }
    }
}

// function to convert date to string - to be altered to am/pm format
extension HomeView {
    func dateToString(date: Date) -> String {
        let dateFormatForDate = DateFormatter()
        dateFormatForDate.timeZone = TimeZone(abbreviation: "PST")
        dateFormatForDate.dateFormat = "HH:mm"
        return dateFormatForDate.string(from: date)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(data: .constant(AlarmProps.AlarmPropsData()))
    }
}
