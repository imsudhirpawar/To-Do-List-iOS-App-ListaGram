    //
    //  ProfileView_ViewModel.swift
    //  To Do List
    //
    //  Created by Sudhir Pawar on 05/05/23.
    //

import FirebaseAuth
import Firebase
import FirebaseFirestore
import Foundation

class ProfileView_ViewModel: ObservableObject {
    
    
    
    @Published var name = "Name"
    @Published var email = "Email"
    @Published var joined = "Year"
    
    
    init() {
        
       fetchData()
    }
    
    private func fetchData(){
        let db = Firestore.firestore()
        guard let uID = Auth.auth().currentUser?.uid else { return  }
        
        db.collection("users")
            .document(uID)
            .getDocument { snapshot, error in
                if let error = error{
                    print("Failed to fetch the current user", error)
                    return
                }
                
                guard let data = snapshot?.data() else { return }
                
                self.name = data["name"] as? String ?? ""
                self.email = data["email"] as? String ?? ""
                
                let joinedTimestamp = data["joined"] as? Timestamp ?? Timestamp(date: Date())
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy"
                self.joined = dateFormatter.string(from: joinedTimestamp.dateValue())
            }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    func toggleIsDone(item: ToDoListItem) {
        
        let isDone = !item.isDone
        
        
        let db = Firestore.firestore()
        
        guard let uID = Auth.auth().currentUser?.uid else { return  }
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(item.id)
            .updateData(["isDone" : isDone])
        
        
    }
    
    /*
     func toggleIsDone(item: ToDoListItem) {
     let isDone = !item.isDone
     let db = Firestore.firestore()
     guard let uID = Auth.auth().currentUser?.uid else { return }
     let confirmMessage = isDone ? "Do you want to mark this item as complete?" : "Do you want to mark this item as incomplete?"
     let alert = UIAlertController(title: "Confirmation", message: confirmMessage, preferredStyle: .alert)
     let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
     let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
     db.collection("users")
     .document(uID)
     .collection("todos")
     .document(item.id)
     .updateData(["isDone" : isDone])
     }
     alert.addAction(cancelAction)
     alert.addAction(confirmAction)
     UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
     }
     */
    
    
    
}
