    //
    //  NewItemView.swift
    //  To Do List
    //
    //  Created by Sudhir Pawar on 05/05/23.
    //

/**
 
 @BINDING :-
 
 When you mark a property with the @Binding property wrapper, you are telling SwiftUI that the value of this property will be provided by a parent view and it can be modified by the child view. This is useful when you want to pass data between views and allow the user to modify that data in one view, while reflecting those changes in the other view.
 */

import SwiftUI

struct SingleItemView: View {
    
    @StateObject var viewModel = SingleItemView_ViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.system(size: 32) )
                .bold()
                .fontDesign(.rounded)
                .foregroundColor(.teal)
                .padding(.top, 100)
            
            
            
            
            Form{
                    // TITLE
                VStack(alignment: .leading, spacing: 11) {
                                Text("Title")
                                    .font(.headline)
                                    .foregroundColor(.brown)
                                    .fontDesign(.rounded)
                                    

                    TextField("Enter title", text: $viewModel.title)
                            }

                            VStack(alignment: .leading, spacing: 10) {
                                Text("Description")
                                    .font(.headline)
                                    .foregroundColor(.brown)
                                    .fontDesign(.rounded)

                                TextEditor(text: $viewModel.desc)
                                    .frame(height: 70)
                            }
               
                        // DUE DATE
                    
                VStack(alignment: .leading, spacing: 10) {
                    

//                    DatePicker("Due Date", selection: $viewModel.duedate)
                    
                    let today = Date()
                            let calendar = Calendar.current
                            let minimumDate = calendar.startOfDay(for: today)
                            
                    DatePicker("Due Date", selection: $viewModel.duedate, in: minimumDate..., displayedComponents: [.date, .hourAndMinute])
                        .padding(.top, 1)
                        .foregroundColor(.cyan)
                        .bold()
                                
                       
                }
                        
                    
                
                    // SAVE BUTTON
                
                ButtonView(title: "Save Task", bgColor: .mint) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                    
                }
                .padding()
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Title cannot be empty."))
                }
                 
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
