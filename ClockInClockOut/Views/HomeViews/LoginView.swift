//
//  LoginView.swift
//  ClockInClockOut
//
//  Created by Gabe Sianipar on 28/12/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: ContentViewViewModel

    var body: some View {
        VStack {
            Group {
                TextField("Enter your email here...", text: self.$viewModel.mail)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
                
                if !self.viewModel.invalidMail.isEmpty {
                    Text(self.viewModel.invalidMail)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }

            SecureField("Password", text: self.$viewModel.pass)
                .textContentType(.password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 40)

            Button("Login") {
                debugPrint("login")
            }
            .disabled(!self.viewModel.canSend)
            .foregroundColor(.blue)
        }
        .padding()
    }
}
