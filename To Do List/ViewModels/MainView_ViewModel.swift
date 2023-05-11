//
//  MainView ViewModel.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import FirebaseAuth
import Foundation

class MainView_ViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        })
        
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
