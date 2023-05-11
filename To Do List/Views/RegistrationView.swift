//
//  RegistrationView.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import SwiftUI

struct RegistrationView: View {
    
   @StateObject var viewModel = RegistrationView_ViewModel()
    
    var body: some View {
        VStack{
           
            HeaderView( title: "Register",
                        subtitle: "Never Miss a Task Again",
                        angle: -15,
                        background: .orange
                    )

            
         
                
                
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Full Name", text: $viewModel.name)
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                    
                    ButtonView(
                        title: "Sign Up",
                        bgColor: .green){
                            
                                // Do registration Action
                            viewModel.register()
                            
                        }
                        .padding()
                }
                .offset(y: -80)
                
            
            
            Spacer()
        }
        
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
