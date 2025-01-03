//
//  HistoryView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 26/12/24.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: ClockViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.clockEvents.reversed()) { event in
                VStack(alignment: .leading) {
                    Text(Formatters.dateFormatter.string(from: event.clockInTime))
                        .font(.headline)
                    Text("Clock In: \(Formatters.timeFormatter.string(from: event.clockInTime))")
                    if let outTime = event.clockOutTime {
                        Text("Clock Out: \(Formatters.timeFormatter.string(from: outTime))")
                        Text("Total Hours: \(String(format: "%.2f", event.totalHours))")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 5)
            }
        }
    }
}
