//
//  ContentView.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            DisplayView()
                .padding([.leading, .trailing], 40)
                .padding(.top, 78)
            WheelView()
            Spacer()
        }
        .background(ViewConstants.deviceColor)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
