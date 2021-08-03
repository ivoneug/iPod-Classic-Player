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
    private var player: AVPlayer?
    
    var menu: [MenuItem] {
        model.menuRoot
    }
    var selectedMenuItem: MenuItem {
        model.selectedMenuItem
    }
    
    init() {
        model = Model()
        model.onSongSelect = self.playMenuItem
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
    
    func playMenuItem() {
        DispatchQueue.main.async { [self] in
            playMenuItemInternal()
        }
    }
    
    private func playMenuItemInternal() {
        guard let nowPlaying = model.nowPlayingSong else {
            return
        }
        guard let path = nowPlaying.path else {
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player?.play()
    }
    
    func playTapGesture() {
        AudioServicesPlaySystemSound(1104)
    }
}
