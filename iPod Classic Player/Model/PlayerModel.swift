//
//  PlayerModel.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 03.08.2021.
//

import Foundation

struct PlayerModel {
    var isPlaying: Bool = false
    
    var trackList = [MenuItem]()
    var nowPlayingIndex: Int = -1
    
    var nowPlayingSong: MenuItem? {
        if nowPlayingIndex == -1 {
            return nil
        }
        
        return Optional(trackList[nowPlayingIndex])
    }
}
