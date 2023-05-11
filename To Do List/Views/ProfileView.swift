//
//  ProfileView.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileView_ViewModel()
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("Profile")
            .navigationBarItems(trailing:
                            Button(action: {
                                viewModel.signOut()
                            }) {
                                Text("Sign Out")
                            }
                        )
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
