//
//  MenuItemView.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import SwiftUI

struct MenuItemView: View {
    var menuItem: MenuItem
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(menuItem.name)
                .lineLimit(1)
            Spacer()
            if menuItem.children.count > 0 || menuItem.id == 0 {
                Image(systemName: "chevron.right")
            }
        }
        .font(ViewConstants.systemFont)
        .padding(ViewConstants.verticalPadding)
        .padding([.leading, .trailing], ViewConstants.horizontalPadding)
        .foregroundColor(isSelected ? ViewConstants.menuTextActiveColor : ViewConstants.menuTextInactiveColor)
        .background(isSelected ? ViewConstants.menuActiveColor : ViewConstants.menuInactiveColor)
    }
    
    private let verticalPadding: CGFloat = 2
    private let horizontalPadding: CGFloat = 6
}

struct MenuItemView_Previews: PreviewProvider {
    static var menuItem = MenuItem(
        id: 1,
        name: "Music",
        children: [MenuItem(id: 11, name: "Submenu 1", children: [])]
    )
    
    static var previews: some View {
        MenuItemView(menuItem: menuItem, isSelected: true)
    }
}
