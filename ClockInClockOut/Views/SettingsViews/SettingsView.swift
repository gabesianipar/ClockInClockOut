//
//  SettingsView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 26/12/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
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
    }
}

#Preview {
    SettingsView()
}

