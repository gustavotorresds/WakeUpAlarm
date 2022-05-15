//
//  AlarmStructs.swift
//  WakeUpAlarm
//
//  Created by Arjun Mangla on 5/15/22.
//

import Foundation

// Simple Alarm property model - defines parameters as well as globally passed through data object

struct AlarmProps {
    var finalWakeUpTime: Date // type to be converted using DateFormatter class
    var timeIntervalLength: Double // in # of mins
    var alarmFrequency: Int // number of times the alarm should ring
    
    init(finalWakeUpTimeString: String, timeIntervalLength: Double, alarmFrequency: Int) {
        let dateFormatForDate = DateFormatter()
        dateFormatForDate.timeZone = TimeZone(abbreviation: "PST")
        dateFormatForDate.dateFormat = "dd-MM-yyyy HH:mm:ss"
        self.finalWakeUpTime = dateFormatForDate.date(from: finalWakeUpTimeString)!
        
        self.timeIntervalLength = timeIntervalLength
        self.alarmFrequency = alarmFrequency
    }
}

extension AlarmProps {
    struct AlarmPropsData {
        var finalWakeUpTime: Date = Date()
        var timeIntervalLength: Double = 5 // in # of mins
        var alarmFrequency: Int = 6 // number of times the alarm should ring
    }
    
    var data: AlarmPropsData {
        AlarmPropsData(finalWakeUpTime: finalWakeUpTime, timeIntervalLength: timeIntervalLength, alarmFrequency: alarmFrequency)
    }
}


//extension AlarmProps {
//    func dateToString(date: Date) -> String {
//        let dateFormatForDate = DateFormatter()
//        dateFormatForDate.timeZone = TimeZone(abbreviation: "PST")
//        dateFormatForDate.dateFormat = "HH:mm"
//        return dateFormatForDate.string(from: date)
//    }
//}
