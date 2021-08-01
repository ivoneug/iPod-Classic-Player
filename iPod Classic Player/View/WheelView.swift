//
//  WheelView.swift
//  iPod Classic Player
//
//  Created by Evgeniy on 31.07.2021.
//

import SwiftUI
import AVFoundation

struct WheelView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var lastAngle: CGFloat = 0
    @State private var counter: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                renderCircle(geometry: geometry)
                renderButtons(geometry: geometry)
            }
        }
    }
    
    private func renderCircle(geometry: GeometryProxy) -> some View {
        Circle()
            .frame(
                width: geometry.size.width * outerRingScale,
                height: geometry.size.width * outerRingScale
            )
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            .foregroundColor(ViewConstants.grayColor)
            .overlay(
                Circle()
                    .frame(
                        width: geometry.size.width * innerRingScale,
                        height: geometry.size.width * innerRingScale
                    )
                    .foregroundColor(Color.white)
                    .gesture(
                        TapGesture(count: 1)
                            .onEnded {
                                viewModel.enterMenuItem()
                                viewModel.playTapGesture()
                            })
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        var angle = atan2(value.location.x - geometry.size.width * outerRingScale / 2, geometry.size.width * outerRingScale / 2 - value.location.y) * 180 / .pi
                        if angle < 0 {
                            angle += 360
                        }
                        
                        let theta = lastAngle - angle
                        lastAngle = angle
                        
                        if abs(theta) < 20 {
                            counter += theta
                        }
                        
                        if counter > 20 {
                            viewModel.selectPreviousMenuItem()
                            viewModel.playTapGesture()
                        } else if counter < -20 {
                            viewModel.selectNextMenuItem()
                            viewModel.playTapGesture()
                        }
                        
                        if abs(counter) > 20 {
                            counter = 0
                        }
                    }
                    .onEnded { value in
                        counter = 0
                    }
            )
    }
    
    private func renderButtons(geometry: GeometryProxy) -> some View {
        Group {
            Text("MENU")
                .offset(y: -geometry.size.width / 2 * 0.65)
            Image(systemName: "playpause.fill")
                .offset(y: geometry.size.width / 2 * 0.65)
            Image(systemName: "forward.end.alt.fill")
                .offset(x: geometry.size.width / 2 * 0.65)
            Image(systemName: "backward.end.alt.fill")
                .offset(x: -geometry.size.width / 2 * 0.65)
        }
        .font(ViewConstants.systemFont)
        .foregroundColor(.white)
        .shadow(radius: 5)
    }
    
    private let outerRingScale: CGFloat = 0.83
    private let innerRingScale: CGFloat = 0.25
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
            .environmentObject(ViewModel())
    }
}
