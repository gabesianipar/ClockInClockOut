//
//  ClockInClockOutApp.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 26/12/24.
//

import SwiftUI
import Firebase

@main
struct ClockInClockOutApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
