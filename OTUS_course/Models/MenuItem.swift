//
//  MenuItem.swift
//  OTUS_course
//
//  Created by Анастасия Леонтьева on 24.06.2024.
//

import Foundation

struct MenuItem: Identifiable, Codable {
    var id: String = UUID().uuidString
    let name: String
    
    static var all: [MenuItem] {
        get async {
            [
                MenuItem(name: "Main Course"),
                MenuItem(name: "Appetizer"),
                MenuItem(name: "Dessert"),
                MenuItem(name: "Drinks")
            ]
        }
    }
}
