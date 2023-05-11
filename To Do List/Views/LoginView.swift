//
//  LoginView.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//


/**
 @STATEOBJECT :-
 
 @StateObject is similar to @ObservedObject in that it is used to declare a property that can be modified from outside of a view, such as from a ViewModel, and any changes to the value of the property will cause the view to be re-rendered. However, @StateObject is used with a class or struct that conforms to the ObservableObject protocol, and it is used to create a new instance of the object that will be retained by the view.
 
 */
import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginView_ViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack{
                // Header
                HeaderView(title: "ListaGram", subtitle: "Maximize Your Productivity", angle: 15, background: .pink)
                
                
                // Login Form
                
                Form{
                    
                        // Error handling
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }

    //                TextField(placeholder, binding)
                    TextField("Email Address", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                        
                    SecureField("Password", text: $viewModel.password)
                    
                    ButtonView(
                        title: "Log In",
                        bgColor: .green){
                            
                            // Do login Action
                            viewModel.login()
                            
                        }
                    .padding()
                    

                    
                }
                .offset(y: -80)
                
                    
                
                
                
                // Create Account
                
                
                VStack{
                    Text("New around here ?")
                        .padding(.ulpOfOne)
                    NavigationLink("Create new account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
