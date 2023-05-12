//
//  ToDoListItem.swift
//  To Do List
//
//  Created by Sudhir Pawar on 05/05/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {

let id: String
let title: String
let desc: String
let dueDate: TimeInterval
let createdDate: TimeInterval
var isDone: Bool



    mutating func setDone(_ state: Bool) {
     isDone = state
}

}
