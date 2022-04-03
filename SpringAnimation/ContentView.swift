//
//  ContentView.swift
//  SpringAnimation
//
//  Created by  Khushi Bhardwaj on 3/13/22.
//

import SwiftUI

struct ContentView: View {
    
    private(set) static var circleColors: [Color] = [.gray, .indigo, .blue, .green.opacity(0.8), .cyan, .yellow, .orange, .red]
    
    enum AnimationMode {
        case manual
        case auto
    }
    
    @State var currentMode: AnimationMode = .manual
    @State var colorEnabled = true
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .padding()
                    .foregroundStyle(RadialGradient(colors: colorEnabled ? ContentView.circleColors : [.white, .gray], center: .center, startRadius: 0, endRadius: .pi*6))
                    .onTapGesture { colorEnabled.toggle() }
                Picker(selection: $currentMode) {
                    Text("Manual")
                        .tag(AnimationMode.manual)
                    Text("Auto")
                        .tag(AnimationMode.auto)
                } label: {
                    Text("Mode")
                }
                .pickerStyle(.segmented)
            }
            //.frame(maxHeight: 35)
            
            if (currentMode == .auto) {
                ChainedSpiralAuto(colorEnabled: $colorEnabled)
            } else {
                ChainedSpiralManual(colorEnabled: $colorEnabled)
            }

        }
        //TabView {
//            ChainedSpiralAuto()
//                //.tag(AnimationMode.auto)
//                .tabItem {
//                    Label {
//                        Text("Auto")
//                    } icon: {
//                        Image(systemName: "arrow.clockwise")
//                            .imageScale(.large)
//                    }
//                }
//
//            ChainedSpiralManual()
//                //.tag(AnimationMode.manual)
//                .tabItem {
//                    Label {
//                        Text("Manual")
//                    } icon: {
//                        Image(systemName: "scribble.variable")
//                            .imageScale(.large)
//                    }
//
//                }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
