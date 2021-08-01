//
//  HeaderView.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("iPod")
            .font(ViewConstants.systemFont)
            .padding(ViewConstants.verticalPadding)
            .padding([.leading, .trailing], ViewConstants.horizontalPadding)
            .frame(maxWidth: .infinity)
            .foregroundColor(ViewConstants.menuTextInactiveColor)
            .background(ViewConstants.displayBackgroundColor)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
