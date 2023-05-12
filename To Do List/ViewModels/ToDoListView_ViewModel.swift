//
//  ToDoListView_ViewModel.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import FirebaseFirestore
import Foundation
 
class ToDoListView_ViewModel: ObservableObject {
    
    
    @Published var showingSingleItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
}
