//
//  ProfileView_ViewModel.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import Firebase
import Foundation
class ProfileView_ViewModel: ObservableObject {
    
    init() {
        
    }
    
    func signOut() {
            do {
                try Auth.auth().signOut()
            } catch let error {
                print("Error signing out: \(error.localizedDescription)")
            }
        }
    
    func toggleIsDone(item: ToDoListItem){
        
    }
}
