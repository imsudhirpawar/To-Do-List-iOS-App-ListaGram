//
//  ButtonView.swift
//  To Do List
//
//  Created by Sudhir Pawar on 06/05/23.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let bgColor: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            withAnimation {
                action()
            }
            
        }label: {
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                //                            .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .fontDesign(.rounded)
                    .font(.title2)
                
            }
            
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Hey! I'm a button", bgColor: .brown, action: {
            //Action
        })
    }
}
