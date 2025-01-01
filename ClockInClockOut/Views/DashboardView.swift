//
//  DashboardView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 01/01/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    @State private var isClockedIn = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                Circle()
                    .strokeBorder(isClockedIn ? Color.red : Color.green, lineWidth: 8)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Button(action: {
                            isClockedIn.toggle()
                        }) {
                            Text(isClockedIn ? "Clock Out" : "Clock In")
                                .font(.title)
                                .foregroundColor(isClockedIn ? .red : .green)
                        }
                    )
                
                if isClockedIn {
                    Text("Clocked in at 9:00 AM")
                        .padding(.top)
                }
            }
            .tabItem {
                Image(systemName: "clock")
                Text("Clock In")
            }
            .tag(0)
            
            List {
                ForEach(1...5, id: \.self) { _ in
                    VStack(alignment: .leading) {
                        Text("January 1, 2025")
                            .font(.headline)
                        Text("Clock In: 9:00 AM")
                        Text("Clock Out: 5:00 PM")
                        Text("Total Hours: 8")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                }
            }
            .tabItem {
                Image(systemName: "clock.arrow.circlepath")
                Text("History")
            }
            .tag(1)
            
            VStack {
                DatePicker(
                    "Select Date",
                    selection: .constant(Date()),
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                
                List {
                    Text("Hours Worked: 8")
                    Text("Clock In: 9:00 AM")
                    Text("Clock Out: 5:00 PM")
                }
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }
            .tag(2)
            
            // Settings View
            List {
                Section(header: Text("Work Schedule")) {
                    Toggle("Auto Clock-out", isOn: .constant(true))
                    Toggle("Overtime Alerts", isOn: .constant(true))
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Clock-in Reminders", isOn: .constant(true))
                    Toggle("Break Reminders", isOn: .constant(true))
                }
                
                Section(header: Text("Account")) {
                    NavigationLink("Profile Settings") {
                        Text("Profile Settings View")
                    }
                    NavigationLink("Work Hours") {
                        Text("Work Hours View")
                    }
                    Button("Sign Out") {
                        // Handle sign out
                    }
                    .foregroundColor(.red)
                }
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(3)
        }
    }
}
