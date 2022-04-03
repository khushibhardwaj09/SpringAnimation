//
//  ContentView.swift
//  SpringAnimation
//
//  Created by  Khushi Bhardwaj on 3/13/22.
//

import SwiftUI

struct ContentView: View {
    
    enum AnimationMode {
        case manual
        case auto
    }
    
    @State var currentMode: AnimationMode = .manual
    
    
    var body: some View {
        VStack {
            Picker(selection: $currentMode) {
                Text("Manual")
                    .tag(AnimationMode.manual)
                Text("Auto")
                    .tag(AnimationMode.auto)
            } label: {
                Text("Mode")
            }
            .pickerStyle(.segmented)
            
            if (currentMode == .auto) {
                ChainedSpiralAuto()
            } else {
                ChainedSpiralManual()
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
