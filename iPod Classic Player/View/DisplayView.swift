//
//  DisplayView.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import SwiftUI

struct DisplayView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
            Divider()
                .background(ViewConstants.menuTextInactiveColor)
            ForEach(viewModel.menu) { item in
                MenuItemView(menuItem: item, isSelected: item == viewModel.selectedMenuItem)
            }
            Spacer()
        }
        .background(ViewConstants.displayBackgroundColor)
        .frame(width: 320, height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2).foregroundColor(ViewConstants.menuTextInactiveColor))
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
            .environmentObject(ViewModel())
    }
}
