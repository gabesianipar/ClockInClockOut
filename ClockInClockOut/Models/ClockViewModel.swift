//
//  ClockViewModel.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 03/01/25.
//

import Foundation

class ClockViewModel: ObservableObject {
    @Published var currentEvent: ClockEvent?
    @Published var clockEvents: [ClockEvent] = []
    @Published var isClockedIn: Bool = false
    
    init() {
        loadEvents()
    }
    
    func clockIn() {
        let newEvent = ClockEvent(id: UUID(), clockInTime: Date(), clockOutTime: nil)
        currentEvent = newEvent
        isClockedIn = true
        saveEvents()
    }
    
    func clockOut() {
        guard var event = currentEvent else { return }
        event.clockOutTime = Date()
        clockEvents.append(event)
        currentEvent = nil
        isClockedIn = false
        saveEvents()
    }
    
    private func saveEvents() {
        if let encoded = try? JSONEncoder().encode(clockEvents) {
            UserDefaults.standard.set(encoded, forKey: "ClockEvents")
        }
    }
    
    private func loadEvents() {
        if let data = UserDefaults.standard.data(forKey: "ClockEvents"),
           let decoded = try? JSONDecoder().decode([ClockEvent].self, from: data) {
            clockEvents = decoded
        }
    }
    
    func getEventsForDate(_ date: Date) -> [ClockEvent] {
        return clockEvents.filter { Calendar.current.isDate($0.clockInTime, inSameDayAs: date) }
    }
}
