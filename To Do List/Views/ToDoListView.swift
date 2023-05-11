    //
    //  ToDoListView.swift
    //  To Do List
    //
    //  Created by Sudhir Pawar on 05/05/23.
    //

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListView_ViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userId: String) {
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
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
                                    .foregroundColor(.red)

                            }


                        }
                }
                .listStyle(.sidebar)
                
                
            }
            
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                        // Action
                    viewModel.showingSingleItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
                
            }
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


