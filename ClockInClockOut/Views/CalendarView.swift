//
//  CalendarView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 03/01/25.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel: ClockViewModel
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            DatePicker(
                "Select Date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
            
            let dailyEvents = viewModel.getEventsForDate(selectedDate)
            List {
                ForEach(dailyEvents) { event in
                    VStack(alignment: .leading) {
                        Text("Clock In: \(Formatters.timeFormatter.string(from: event.clockInTime))")
                        if let outTime = event.clockOutTime {
                            Text("Clock Out: \(Formatters.timeFormatter.string(from: outTime))")
                            Text("Hours Worked: \(String(format: "%.2f", event.totalHours))")
                        }
                    }
                }
            }
        }
    }
}


//#Preview {
//    CalendarView()
//}
