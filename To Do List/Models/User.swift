//
//  Users.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import Foundation

struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let password: String
    let joined: TimeInterval
    
}
