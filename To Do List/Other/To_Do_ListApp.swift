//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import FirebaseCore
import SwiftUI

@main
struct To_Do_ListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
