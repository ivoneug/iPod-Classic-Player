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
            
            ScrollView {
                ScrollViewReader { proxy in
                    renderMenuItems(proxy: proxy)
                }
            }
            Spacer()
        }
        .background(ViewConstants.displayBackgroundColor)
        .frame(width: 320, height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2).foregroundColor(ViewConstants.menuTextInactiveColor))
    }
    
    private func renderMenuItems(proxy: ScrollViewProxy) -> some View {
        VStack(spacing: 0) {
            ForEach(viewModel.menu) { item in
                MenuItemView(menuItem: item, isSelected: item == viewModel.selectedMenuItem)
                    .id(item.id)
            }
        }
        .onChange(of: viewModel.selectedMenuItem, perform: { value in
            proxy.scrollTo(viewModel.selectedMenuItem.id)
        })
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
            .environmentObject(ViewModel())
    }
}
