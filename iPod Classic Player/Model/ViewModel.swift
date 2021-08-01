//
//  ViewModel.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import Foundation
import AVFoundation

class ViewModel: ObservableObject {
    @Published private var model: Model
    
    var menu: [MenuItem] {
        model.menuRoot
    }
    var selectedMenuItem: MenuItem {
        model.selectedMenuItem
    }
    
    init() {
        model = Model()
    }
    
    func selectNextMenuItem() {
        model.nextMenuItem()
    }
    
    func selectPreviousMenuItem() {
        model.previousMenuItem()
    }
    
    func enterMenuItem() {
        model.enterMenuItem()
    }
    
    func playTapGesture() {
        AudioServicesPlaySystemSound(1104)
    }
}
