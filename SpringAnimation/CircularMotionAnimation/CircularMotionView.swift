//
//  CircularMotionView.swift
//  SpringAnimation
//
//  Created by Rahul Narayanan on 4/3/22.
//

import SwiftUI

struct CircularMotionView: View {
    
    @State private var moving = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(lineWidth: circleStrokeWidth)
                .rotation(.degrees(180))
                .rotationEffect(.degrees(moving ? circleRotationAngle : 0), anchor: .center)
                .animation(.easeInOut.speed(circleRotationSpeed).repeatForever(autoreverses: true), value: moving)
                .frame(width: circleRadius * 2, height: circleRadius * 2)
            
            ZStack(alignment: .top) {
                Circle()
                    .frame(width: ballRadius * 2, height: ballRadius * 2)
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.primary).colorInvert()
                    .padding(5)
            }
            .offset(y: circleRadius - ballRadius)
            .rotationEffect(.degrees(moving ? -circleRotationAngle : circleRotationAngle / 2), anchor: .center)
            .animation(.easeInOut.speed(circleRotationSpeed).repeatForever(autoreverses: true), value: moving)
        }
        .padding()
        .onAppear { moving = true }
    }
    
    private let circleRadius: CGFloat = 180
    private let circleStrokeWidth: CGFloat = 5.0
    private let circleRotationAngle: Double = -40
    private let circleRotationSpeed: Double = 0.2
    
    private let ballRadius: CGFloat = 25
}

struct CircularMotionView_Previews: PreviewProvider {
    static var previews: some View {
        CircularMotionView()
            .preferredColorScheme(.dark)
    }
}
