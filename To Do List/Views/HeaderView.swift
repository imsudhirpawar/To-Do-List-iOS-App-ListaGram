//
//  HeaderView.swift
//  To Do List
//
//  Created by Sudhir Pawar on 06/05/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
                
            VStack{
//                    Text("To Do List")
                Text(title)
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .bold()
                    .fontDesign(.rounded)
                
//                    Text("Get More Done with ListaGram")
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .bold()
                    .fontDesign(.rounded)
            }
            .padding(.top, 100)
            
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "subtitle", angle: 0, background: .black)
    }
}
