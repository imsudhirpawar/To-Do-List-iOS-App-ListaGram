//
//  RegistrationView_ViewModel.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegistrationView_ViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func register() {
        
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard let userId = result?.user.uid else {
                
                return
                             }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        
            let newUser = User(id: id,
                               name: name,
                               email: email,
                               password: password,
                               
                               joined: Date().timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Plesase fill in all the fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Plesae enter a valid email address."
            
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Length of Password should be greater than 5."
            
            return false
        }
        
        
        return true
    }
}
