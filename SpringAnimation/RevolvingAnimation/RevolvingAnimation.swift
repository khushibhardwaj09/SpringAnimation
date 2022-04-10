//
//  RevolvingAnimation.swift
//  SpringAnimation
//
//  Created by  Khushi Bhardwaj on 4/9/22.
//

import SwiftUI

struct RevolvingAnimation: View {
    
    @State var isRotated = false
    
    var body: some View {
        GeometryReader { geo in // defines the content wrt to its own size
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                Circle()
                    .frame(width: ballRadius * 2, height: ballRadius * 2)
                    .offset(y: ballOffset(using: geo.size))
                    .foregroundColor(.lightBlue) //from the extension
                    .rotation3DEffect(.degrees(isRotated ? 0 : 360), axis: (0,0,1))
                    .animation(.linear(duration: 2.5).repeatForever(autoreverses: false), value: isRotated)
            }
            .rotation3DEffect(.degrees(rotationAngle), axis: (1,0,0))
        }
        .padding()
        .onAppear {
            isRotated.toggle()
        }
    }
    
    private let rotationAngle: Double = 70
    private let ballRadius: CGFloat = 15
    private func ballOffset(using size: CGSize) -> CGFloat {
        return size.width / 2
    }
}

struct RevolvingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        RevolvingAnimation()
    }
}
