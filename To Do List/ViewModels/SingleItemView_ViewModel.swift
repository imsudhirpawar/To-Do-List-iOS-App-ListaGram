//
//  NewItemView_ViewModel.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
class SingleItemView_ViewModel: ObservableObject {
    
    
    @Published var title = ""
    @Published var desc = ""
    @Published var showAlert = false
    @Published var duedate = Date()  
    
    init() {
        
    }
    
    func save(){
        
        guard canSave else { return }
        
//        get currect userid
        
        guard let uID = Auth.auth().currentUser?.uid else { return  }
        
//        create Model
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   desc: desc,
                                   dueDate: duedate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
//        Save Model
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        
        
        return true
    }
}
