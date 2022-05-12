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
    struct AlarmSettings {
        // - Wake-up time (i.e., by when the user must be up)
        // - Number of times the alarm should ring (constant for now)
        // - Interval of time between alarms (constant for now)
    }
    
    // Variables -- we should make sure the variable names are super clear
    
    // - globalAlarmSettings
    // - upcomingAlarmSettings
    // - alarmIsOn
    // - alarmShouldRing
    
    // Functions
    
    // Returns the upcoming wake-up datetime.
    // Example functionality:
    // - If the general settings are for 7a, the upcoming alarm follows the general settings and it's currently past 7a of May 11, the function will return May 12 7:00
    // - If the general settings are for 7a, the upcoming alarm was edited to 8a and it's currently past 7a of  May 11, the function will return May 12 8:00
    // - If the general settings are for 7a, the upcoming alarm was edited to 8a and it's currently 5a of May 11, the function will return May 11 8:00
    // - If the alarm is off, the function will return null
    func getUpcomingDateTime() {

    }
    
    // Takes in a time and updates the global AlarmSettings.
    func updateGeneralTime() {
        
    }
    
    // Takes in a time and updates the upcoming AlarmSettings.
    func updateUpcomingTime() {
        
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
}
