//
//  iPod_Classic_PlayerApp.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import SwiftUI

@main
struct iPod_Classic_PlayerApp: App {
    private let viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
