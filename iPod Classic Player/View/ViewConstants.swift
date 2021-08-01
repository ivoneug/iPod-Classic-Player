//
//  ViewConstants.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 01.08.2021.
//

import SwiftUI

struct ViewConstants {
    static let verticalPadding: CGFloat = 4
    static let horizontalPadding: CGFloat = 6
    
    static let displayBackgroundColor = Color(red: 0.81, green: 0.87, blue: 0.93)
    static let grayColor = Color(red: 0.86, green: 0.88, blue: 0.87)
    static let menuActiveColor = Color(red: 0.20, green: 0.24, blue: 0.48)
    static let menuInactiveColor = displayBackgroundColor
    static let menuTextActiveColor = displayBackgroundColor
    static let menuTextInactiveColor = Color(red: 0.20, green: 0.24, blue: 0.48)
    
    static let deviceColor = Color(red: 0.95, green: 0.95, blue: 0.95)
    
    static let systemFont = Font.custom("helvetica", size: 24).bold()
}
