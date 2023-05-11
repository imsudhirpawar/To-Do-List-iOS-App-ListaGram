//
//  LoginView_ViewModel.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//


/*
STATE :-

@State is used to declare a property whose value can be modified within a view, and any changes to the value of the property will cause the view to be re-rendered.


PUBLISHED :-

@Published is used to declare a property whose value can be modified from outside of a view, such as from a ViewModel, and any changes to the value of the property will cause the view to be re-rendered.


OBSERVABLEOBJECTS :-

Observable Objects used to manage the state of your application and can be observed by any view that depends on them. When a property within an observable object changes, SwiftUI automatically re-renders any views that depend on that property, updating the view with the new value of the property. This makes it easy to create reactive, data-driven interfaces in SwiftUI.
*/

import FirebaseAuth
import Foundation

class LoginView_ViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login() {
        guard validate() else {
            return
        }
        
//        Try login
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all the fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter a valid email address."
            
            return false
        }
        
        return true
    }
}
