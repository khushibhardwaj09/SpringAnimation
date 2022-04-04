//
//  ChainedSpring.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond
//  Hint: Apply a different delay to each oval the achieve this spring effect.
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct SpringAnimationManual: View {
    
    @Binding var colorEnabled: Bool
    @State var gestureOffset: CGFloat = 0.0
    @State var stiffness: Double = SpringAnimationManual.defaultChangingStiffness
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                ForEach(0..<8) { index in
                    Circle()
                        .stroke(lineWidth: 5)
                        .frame(width: 20 + CGFloat(30 * index), height: 20 + CGFloat(30 * index))
                        .rotation3DEffect(.degrees(75), axis: (1, 0, 0))
                        .offset(y: gestureOffset)
                        .animation(.interpolatingSpring(stiffness: stiffness, damping: 9).delay(Double(index) * 0.06), value: gestureOffset)
                        .foregroundColor(colorEnabled ? SpringAnimationView.circleColors[index] : .primary)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(DragGesture().onChanged({ gesture in
                stiffness = SpringAnimationManual.defaultChangingStiffness
                gestureOffset = gesture.translation.height
            }).onEnded({ _ in
                stiffness = SpringAnimationManual.defaultEndedStiffness
                gestureOffset = 0.0
            }))
        }
    }
    
    // Constants
    private static let defaultChangingStiffness: Double = 100
    private static let defaultEndedStiffness: Double = 50
    
}

struct Previews_ChainedSpiralManual_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimationManual(colorEnabled: .constant(true))
            .preferredColorScheme(.dark)
    }
}
