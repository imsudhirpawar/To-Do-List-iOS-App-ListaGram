    //
    //  ToDoListView.swift
    //  To Do List
    //
    //  Created by Sudhir Pawar on 05/05/23.
    //

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListView_ViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userId: String) {
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue: ToDoListView_ViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                List(items){ item in
                    
                    ListItemView(item: item)
                        .padding(.top, 10)
                        .swipeActions {
                            Button {
                                    // Handle delete action
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    

                            }
                            .tint(.red)
                            


                        }
                }
                .listStyle(.sidebar)
                
                
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text ("To Do List")
                        .font (.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient(
                            colors: [.red, .orange,
                                     .yellow],
                            startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                            // Action
                        viewModel.showingSingleItemView = true
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            
                    }
                    
                }
            }
            
            .foregroundColor(.mint)
            
            .sheet(isPresented: $viewModel.showingSingleItemView) {
                SingleItemView(newItemPresented: $viewModel.showingSingleItemView )
            }
            
        }
        
        
        
    }
    
    
    
    struct ToDoListView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoListView(userId: "rkt8FWFm6wfPEd00jWtK8eNtFkL2" )
        }
    }
    
}


