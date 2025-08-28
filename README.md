A SwiftUI time tracking app that helps users log their work hours with automatic time calculations.
Features

Clock in/out functionality with timestamp tracking
Automatic calculation of total hours worked
Clean, intuitive SwiftUI interface
Data persistence with Firebase integration
Real-time hour tracking and display

Requirements

iOS 14.0+
Xcode 12.0+
Firebase account for backend services

Setup

Clone the repository:
bashgit clone https://github.com/gabesianipar/ClockInClockOut.git
cd ClockInClockOut

Firebase Setup:

Create a Firebase project at firebase.google.com
Add your iOS app to the project
Download GoogleService-Info.plist and add it to your Xcode project
Enable Firestore Database in your Firebase console


Dependencies:

Firebase SDK is imported via Swift Package Manager
No additional setup required



Project Structure
ClockInClockOut/
├── ClockInClockOut.xcodeproj
├── ClockInClockOut/
│   ├── ClockInClockOutApp.swift      # Main app file
│   ├── ContentView.swift             # Main UI view
│   ├── Models/
│   │   ├── ClockEvent.swift          # Data model for time entries
│   │   └── ClockViewModel.swift      # View model for time logic
│   ├── Views/                        # Additional UI views
│   └── Assets.xcassets              # App assets and images
Usage

Clock In: Tap the clock in button to record your start time
Clock Out: Tap the clock out button to record your end time
View Hours: The app automatically calculates and displays total hours worked
History: View your previous clock in/out events

Data Model
The ClockEvent struct stores:

id: Unique identifier (UUID)
clockInTime: Start timestamp (Date)
clockOutTime: End timestamp (Date?)
totalHours: Calculated hours worked (Double)

Contributing

Fork the repository
Create a feature branch
Make your changes
Test thoroughly on iOS simulator/device
Submit a pull request

License
This project is open source and available under the MIT License.
