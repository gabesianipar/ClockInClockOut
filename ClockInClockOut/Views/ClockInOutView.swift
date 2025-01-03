//
//  ClockInOutView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 03/01/25.
//

import SwiftUI

struct ClockInOutView: View {
    @ObservedObject var viewModel: ClockViewModel
    @State private var elapsedTime: TimeInterval = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var formattedElapsedTime: String {
        let hours = Int(elapsedTime) / 3600
        let minutes = Int(elapsedTime) / 60 % 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(viewModel.isClockedIn ? Color.red : Color.green, lineWidth: 8)
                .frame(width: 200, height: 200)
                .overlay(
                    Button(action: {
                        if viewModel.isClockedIn {
                            viewModel.clockOut()
                            elapsedTime = 0
                        } else {
                            viewModel.clockIn()
                        }
                    }) {
                        Text(viewModel.isClockedIn ? "Clock Out" : "Clock In")
                            .font(.title)
                            .foregroundColor(viewModel.isClockedIn ? .red : .green)
                    }
                )
            
            if viewModel.isClockedIn, let event = viewModel.currentEvent {
                VStack {
                    Text("Clocked in at \(Formatters.timeFormatter.string(from: event.clockInTime))")
                        .padding(.top)
                    
                    Text(formattedElapsedTime)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                        .onReceive(timer) { _ in
                            elapsedTime = Date().timeIntervalSince(event.clockInTime)
                        }
                }
            }
        }
    }
}

//#Preview {
//    ClockInOutView()
//}
