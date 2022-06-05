//
//  Alarm.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/11/22.
//
// The Alarm class holds all wake-up alarm information as well as utilities to change them. Some of the information/utilities it holds:
// - the upcoming alarm time
// - whether the alarm is active
// - alarm settings (e.g., recurring wake-up time, number of times the alarm should ring)
// - trigger to play alarm sound

import Foundation

class Alarm: ObservableObject {
    // Helper structs
    struct Data {
        var finalWakeUpTime: Date
        var timeIntervalLength: Double // in # of mins
        var alarmFrequency: Int // number of times the alarm should ring
        
        init() {
            self.finalWakeUpTime = Date()
            self.timeIntervalLength = 5
            self.alarmFrequency = 6
        }
        
        init(finalWakeUpTimeString: String, timeIntervalLength: Double, alarmFrequency: Int) {
            let dateFormatForDate = DateFormatter()
            dateFormatForDate.timeZone = TimeZone(abbreviation: "PST")
            dateFormatForDate.dateFormat = "dd-MM-yyyy HH:mm:ss"
            self.finalWakeUpTime = dateFormatForDate.date(from: finalWakeUpTimeString)!
            
            self.timeIntervalLength = timeIntervalLength
            self.alarmFrequency = alarmFrequency
        }
    }
    
    // Variables -- we should make sure the variable names are super clear
    
    // - globalAlarmSettings
    @Published private var data: Data
    
    // - upcomingAlarmSettings
    // - alarmIsOn
    // - alarmShouldRing
    
    init() {
        data = Data()
    }
    
    // Functions
    
    // Returns the upcoming wake-up datetime.
    // Example functionality:
    // - If the general settings are for 7a, the upcoming alarm follows the general settings and it's currently past 7a of May 11, the function will return May 12 7:00
    // - If the general settings are for 7a, the upcoming alarm was edited to 8a and it's currently past 7a of  May 11, the function will return May 12 8:00
    // - If the general settings are for 7a, the upcoming alarm was edited to 8a and it's currently 5a of May 11, the function will return May 11 8:00
    // - If the alarm is off, the function will return null
    func getUpcomingDateTime() -> Date {
        return data.finalWakeUpTime
    }
    
    // Takes in a time and updates the global AlarmSettings.
    func updateGeneralTime() {
        
    }
    
    // Takes in a time and updates the upcoming AlarmSettings.
    func updateUpcomingTime(newDateTime: Date) {
        data.finalWakeUpTime = newDateTime
    }
    
    func getStartDateTime() -> Date {
        let totalAlarmDuration = Double(data.timeIntervalLength) * Double(data.alarmFrequency)
        let alarmStartTime = Calendar.current.date(byAdding: .minute, value: -Int(totalAlarmDuration), to: data.finalWakeUpTime)!
        return alarmStartTime
    }
    
    func getTimeIntervalLength() -> Double {
        return data.timeIntervalLength
    }
    
    // Returns whether the alarm
    func isOn() {
        
    }
    
    // Deactivates the global alarm.
    func switchOff() {
        
    }
    
    // Plays the alarm sound.
    // Takes as an argument a function that executes when the alarm rings (useful for situations when we want a view to display or some other behavior to be triggered along with the alarm sound.
    func ring() {
        
    }
    
    // Stops the ringing of the current alarm.
    func shutRinging() {
        
    }
    
    static let sampleAlarm: Alarm = Alarm()
}

