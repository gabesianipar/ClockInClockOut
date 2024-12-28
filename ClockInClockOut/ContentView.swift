//
//  ContentView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 26/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewViewModel = .init()
    @State private var isLoginMode: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    Image(systemName: "deskclock")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .padding(.top, 50)
                        .padding(.bottom, 10)
                    Text("Time to 'Clock In, Clock Out'")
                        .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)

                Spacer()

                VStack {
                    if isLoginMode {
                        LoginView(viewModel: viewModel)
                    } else {
                        RegisterView(viewModel: viewModel)
                    }
                }
                .padding(.horizontal)

                Spacer()

                Button(isLoginMode ? "I don't have an account" : "I have an account already!") {
                    isLoginMode.toggle()
                }
                .padding(.bottom, 50)
                .foregroundColor(.blue)
                
            }
            .frame(maxHeight: .infinity, alignment: .center)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

