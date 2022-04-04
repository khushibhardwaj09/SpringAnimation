//
//  ChainAnimation.swift
//  SpringAnimation
//
//  Created by Rahul Narayanan on 4/3/22.
//

import SwiftUI

struct ChainAnimation: View {
    
    @State private var gestureOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            ForEach(0..<12) { i in
                Circle()
                    .stroke(lineWidth: 5)
                    .offset(y: Double(i) * circleOffset)
                    .offset(x: gestureOffset.width)
                    .animation(
                        .interpolatingSpring(stiffness: 50, damping: 5).delay(Double(i)*0.05), value: gestureOffset)
            }
        }
        .gesture(DragGesture().onChanged({ gesture in
            gestureOffset.width = gesture.translation.width / 2
        }))
        
    }
    
    private let circleOffset: Double = -9
}

struct ChainAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ChainAnimation()
            .preferredColorScheme(.dark)
    }
}
