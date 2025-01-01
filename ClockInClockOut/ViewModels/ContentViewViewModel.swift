//
//  ViewModel.swift
//  LoginFormSample
//
//  Created by Yusuke Hasegawa on 2021/06/04.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewViewModel: ObservableObject {
    
    @Published var mail = ""
    @Published var pass = ""
    @Published var retype = ""
    
    @Published var canSend = false
    @Published var invalidMail = ""
    @Published var invalidPass = ""
    @Published var isRegister = false
    @Published var isLoginMode = true
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    init() {
        let mailValidation = $mail.map({ !$0.isEmpty && $0.isValidEmail }).eraseToAnyPublisher()
        let passValidation = $pass.map({ !$0.isEmpty }).eraseToAnyPublisher()
        let matchValidation = $pass.combineLatest($retype).map({ $0 == $1 }).eraseToAnyPublisher()
        
        Publishers.CombineLatest3($isLoginMode, mailValidation, passValidation)
            .filter { $0.0 }
            .map { _, mail, pass in mail && pass }
            .assign(to: &$canSend)
        
        Publishers.CombineLatest4($isLoginMode, mailValidation, passValidation, matchValidation)
            .filter { !$0.0 }
            .map { _, mail, pass, match in mail && pass && match }
            .assign(to: &$canSend)
        
        $mail.map({ $0.isEmpty || $0.isValidEmail ? "" : "enter valid mail address" })
            .assign(to: &$invalidMail)
        
        $pass.combineLatest($retype)
            .filter({ !$0.1.isEmpty && !$0.1.isEmpty })
            .map({ $0.0 == $0.1 ? "" : "must match password" })
            .assign(to: &$invalidPass)
    }
    
    func register(completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: mail, password: pass) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            DispatchQueue.main.async {
                print("reg is successful")
                self.isRegister = true
                completion(true)
            }
        }
    }

    func login(completion: @escaping (Bool) -> Void) {
        print("mail", mail)
        print("pass", pass)
        Auth.auth().signIn(withEmail: mail, password: pass) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            DispatchQueue.main.async {
                print("login is successful")
                self.isRegister = true
                completion(true)
            }
        }
    }

}



extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
     }
    
}

