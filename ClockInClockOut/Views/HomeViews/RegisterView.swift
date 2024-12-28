
import SwiftUI

struct RegisterView: View {
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

            Group {
                SecureField("Password", text: self.$viewModel.pass)
                    .textContentType(.newPassword)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 10)

                SecureField("Retype Password", text: self.$viewModel.retype)
                    .textContentType(.newPassword)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 10)

                if !self.viewModel.invalidPass.isEmpty {
                    Text(self.viewModel.invalidPass)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }
            

            Button("Register") {
                debugPrint("register")
            }
            .disabled(!self.viewModel.canSend)
            .foregroundColor(.blue)
            .padding(.top, 20)
        }
        .padding()
    }
}

