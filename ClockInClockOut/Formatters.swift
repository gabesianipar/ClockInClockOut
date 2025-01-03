//
//  Formatters.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 03/01/25.
//

import Foundation

struct Formatters {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
}

