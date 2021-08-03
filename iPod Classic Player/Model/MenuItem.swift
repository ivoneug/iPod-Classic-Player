//
//  MenuItem.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import Foundation

struct MenuItem: Identifiable, Equatable {
    var id: Int
    var name: String
    var path: String?
    var children: [MenuItem]
    
    init(id: Int, name: String) {
        self.init(id: id, name: name, children: [])
    }
    
    init(id: Int, name: String, children: [MenuItem]) {
        self.id = id
        self.name = name
        self.children = children
    }
}
