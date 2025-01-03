//
//  DashboardView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 01/01/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = ClockViewModel()
    @State private var selectedTab = 0
    @State private var selectedDate = Date()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ClockInOutView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "clock")
                    Text("Clock In")
                }
                .tag(0)
            
            HistoryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }
                .tag(1)
            
            CalendarView(viewModel: viewModel, selectedDate: $selectedDate)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
        }
    }
}

