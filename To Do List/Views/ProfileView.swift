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
            
                accountInfoView
                    
                Spacer()

            }
            .padding(.top, 20)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text ("Profile")
                        .font (.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient(
                            colors: [.red, .orange,
                                     .yellow],
                            startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        viewModel.signOut()
                    }) {
                        Text("Sign Out")
                    }
                    
                }
            }
            
        }
        
    }
    
    @ViewBuilder
    
    var accountInfoView: some View {
        ZStack {
            
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: 360, height: 150)
                .cornerRadius(20)
            
            HStack(spacing: 12){
                
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .frame(width: 75, height: 75)
                    
                VStack(alignment: .leading, spacing: 3){
                    Text(viewModel.name)
                        .font(.title2)
                        .bold()
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                    
                    Text(viewModel.email)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                    
                    Text("since: \(viewModel.joined)")
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                }
            }
        }



        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
