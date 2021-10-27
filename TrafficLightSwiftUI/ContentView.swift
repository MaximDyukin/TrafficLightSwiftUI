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
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    @State private var labelOfButton = "START"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                ColorCircleView(color: .red).opacity(redLightOpacity)
                ColorCircleView(color: .yellow).opacity(yellowLightOpacity)
                ColorCircleView(color: .green).opacity(greenLightOpacity)
                Spacer()
                startButton
            }
            .padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))
        }
    }
    
    private var startButton: some View {
        Button(action: startButtonTapped) {
            ZStack {
                Color(.systemBlue)
                    .frame(width: 200, height: 60)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 3))
                Text(labelOfButton)
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
    
    private func startButtonTapped() {
        if labelOfButton == "START" {
            labelOfButton = "NEXT"
        }
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
