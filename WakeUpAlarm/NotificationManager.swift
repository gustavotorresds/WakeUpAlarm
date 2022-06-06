import Foundation
import UserNotifications
import CoreLocation

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    @Published var settings: UNNotificationSettings?

    func requestAuthorization(completion: @escaping  (Bool) -> Void) {
        UNUserNotificationCenter.current()
          .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _  in
            self.fetchNotificationSettings()
            completion(granted)
          }
    }

    func fetchNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
          DispatchQueue.main.async {
            self.settings = settings
          }
        }
    }

    func scheduleNotificationSeries(alarm: Alarm) {
        var alarmTime = alarm.getUpcomingDateTime()
        var alarmId = alarm.getId() // ID behavior in this method is not ideal
        for i in 0..<alarm.getAlarmFrequency() {
            scheduleNotificationAt(ringTime: alarmTime, alarmIDString: alarmId)
            alarmTime = Calendar.current.date(byAdding: .minute, value: -Int(alarm.getTimeIntervalLength()), to: alarmTime)!
            alarmId += String(i) // ID behavior in this method is not ideal
        }
    }

    func scheduleNotificationAt(ringTime: Date, alarmIDString: String) {
        let content = UNMutableNotificationContent()
        content.title = "Alarm"
        content.body = "Let's wake up!"
        content.sound = UNNotificationSound.defaultCritical

        var trigger: UNNotificationTrigger?
        trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: ringTime),
            repeats: false)

        if let trigger = trigger {
          let request = UNNotificationRequest(
            identifier: alarmIDString,
            content: content,
            trigger: trigger)
          UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
              print(error)
            }
          }
        }
    }
    
}
