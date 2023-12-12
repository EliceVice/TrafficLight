//
//  ContentView.swift
//  TrafficLight
//
//  Created by Andrei Isayenka on 11/12/2023.
//

import SwiftUI

enum TrafficLightMode {
    case red, redYellow, green, yellow
}

struct ContentView: View {
    @State private var trafficLightMode: TrafficLightMode = .red

    var body: some View {
        VStack {
            Spacer()
            
            TrafficLightView(mode: trafficLightMode)
                .frame(width: 100, height: 300)
            
            Spacer()
            
            Button("Change Mode") {
                self.toggleTrafficLightMode()
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
    }

    private func toggleTrafficLightMode() {
        switch trafficLightMode {
        case .red:
            trafficLightMode = .redYellow
        case .redYellow:
            trafficLightMode = .green
        case .green:
            trafficLightMode = .yellow
        case .yellow:
            trafficLightMode = .red
        }
    }
}

struct TrafficLightView: View {
    var mode: TrafficLightMode

    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(mode == .red || mode == .redYellow ? .red : .gray)
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(mode == .yellow || mode == .redYellow ? .yellow : .gray)

            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(mode == .green ? .green : .gray)
        }
    }
}

#Preview {
    ContentView()
}
