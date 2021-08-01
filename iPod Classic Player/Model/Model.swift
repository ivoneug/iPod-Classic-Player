//
//  Model.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import Foundation

struct Model {
    private var menu: [MenuItem] = [
        MenuItem(id: 1, name: "Music", children: [
            MenuItem(id: 101, name: "Song 1"),
            MenuItem(id: 102, name: "Song 2"),
            MenuItem(id: 103, name: "Song 3"),
            MenuItem(id: 104, name: "Song 4")
        ]),
        MenuItem(id: 2, name: "Extras", children: [
            MenuItem(id: 201, name: "Extra 1"),
            MenuItem(id: 202, name: "Extra 2"),
            MenuItem(id: 203, name: "Extra 3")
        ]),
        MenuItem(id: 3, name: "Settings", children: [
            MenuItem(id: 301, name: "Language"),
            MenuItem(id: 302, name: "Sound Settings"),
            MenuItem(id: 303, name: "About iPod")
        ]),
        MenuItem(id: 4, name: "Shuffle Songs")
    ]
    private var backMenuItem = MenuItem(id: 0, name: "Back", children: [])
    
    var menuRoot: [MenuItem]
    var previousMenuRoot: [MenuItem]
    var selectedMenuItem: MenuItem
    
    init() {
        menuRoot = menu
        previousMenuRoot = []
        selectedMenuItem = menu[0]
    }
    
    mutating func nextMenuItem() {
        guard var index = menuRoot.firstIndex(of: selectedMenuItem) else { return }
        
        if index + 1 < menuRoot.count {
            index += 1
        } else {
            index = 0
        }
        
        selectedMenuItem = menuRoot[index]
    }
    
    mutating func previousMenuItem() {
        guard var index = menuRoot.firstIndex(of: selectedMenuItem) else { return }
        
        if index - 1 >= 0 {
            index -= 1
        } else {
            index = menuRoot.count - 1
        }
        
        selectedMenuItem = menuRoot[index]
    }
    
    mutating func enterMenuItem() {
        if selectedMenuItem == backMenuItem {
            menuRoot = previousMenuRoot
        } else if selectedMenuItem.children.count != 0 {
            previousMenuRoot = menuRoot
            menuRoot = [backMenuItem] + selectedMenuItem.children
        } else {
            return
        }
        
        selectedMenuItem = menuRoot[0]
    }
}
