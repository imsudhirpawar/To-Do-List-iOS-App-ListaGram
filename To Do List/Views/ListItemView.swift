    //
    //  ListItemView.swift
    //  To Do List
    //
    //  Created by Sudhir Pawar on 05/05/23.
    // this file is defines the view of todo in the main screen



import SwiftUI

struct ListItemView: View {
    
    @StateObject var viewModel = ProfileView_ViewModel()
    let item: ToDoListItem
    
    var body: some View {
        
   
            
            
            HStack{
                
                VStack(alignment: .leading){
                    
                    Text(item.title)
                        .font(.headline)
                        .fontDesign(.rounded)
                        .bold()
                        .foregroundColor(.purple)
                        .padding(.bottom, 0.3)
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .foregroundColor(.brown)
                        //                    .font(.subheadline)
                        .bold()
                        .font(.system(size: 15))
                    
                }
                Spacer()
                
                Button{
                    
                    viewModel.toggleIsDone(item: item)
                    
                }label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    
                }
            }
            
        }
    
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: ToDoListItem(id: "123", title: "Dummy To Do", desc: "", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
