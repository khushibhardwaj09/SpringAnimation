//
//  SpringAnimationView.swift
//  SpringAnimation
//
//  Created by Rahul Narayanan on 4/3/22.
//

import SwiftUI

struct SpringAnimationView: View {
    
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
                    .foregroundStyle(RadialGradient(colors: colorEnabled ? SpringAnimationView.circleColors : [.white, .gray], center: .center, startRadius: 0, endRadius: .pi*6))
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
                SpringAnimationAuto(colorEnabled: $colorEnabled)
            } else {
                SpringAnimationManual(colorEnabled: $colorEnabled)
            }

        }

    }
}

struct SpringAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimationView()
    }
}
