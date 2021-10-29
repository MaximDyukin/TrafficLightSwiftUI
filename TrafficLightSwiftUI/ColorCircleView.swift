//
//  ColorCircleView.swift
//  TrafficLightSwiftUI
//
//  Created by Maxim Dukin on 26.10.2021.
//

import SwiftUI

struct ColorCircleView: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 110, height: 110)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red, opacity: 1)
    }
}
