//
//  ClockEvent.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 03/01/25.
//

import Foundation

struct ClockEvent: Identifiable, Codable {
    let id: UUID
    let clockInTime: Date
    var clockOutTime: Date?
    
    var totalHours: Double {
        guard let outTime = clockOutTime else { return 0 }
        return outTime.timeIntervalSince(clockInTime) / 3600
    }
}
