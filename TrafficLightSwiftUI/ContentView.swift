//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Maxim Dukin on 26.10.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var redLightOpacity = 0.3
    @State private var yellowLightOpacity = 0.3
    @State private var greenLightOpacity = 0.3
    
    @State private var currentLight = CurrentLight.red
    @State private var labelOfButton = "START"
    
    private func startButtonTapped() {
        
        let lightIsOn: CGFloat = 1
        let lightIsOff: CGFloat = 0.3
        
        switch currentLight {
        case .red:
            greenLightOpacity = lightIsOff
            redLightOpacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLightOpacity = lightIsOff
            yellowLightOpacity = lightIsOn
            currentLight = .green
        case .green:
            yellowLightOpacity = lightIsOff
            greenLightOpacity = lightIsOn
            currentLight = .red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                ColorCircleView(color: .red, opacity: redLightOpacity)
                ColorCircleView(color: .yellow, opacity: yellowLightOpacity)
                ColorCircleView(color: .green, opacity: greenLightOpacity)
                
                Spacer()
                
                ChangeColorButton(title: labelOfButton) {
                    if labelOfButton == "START" {
                        labelOfButton = "NEXT"
                    }
                    startButtonTapped()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
