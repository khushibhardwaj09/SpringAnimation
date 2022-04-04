//
//  ChainAnimation.swift
//  SpringAnimation
//
//  Created by Rahul Narayanan on 4/3/22.
//

import SwiftUI

struct ChainAnimation: View {
    var body: some View {
        VStack {
            ForEach(0..<12) { i in
                Circle()
                    .stroke(lineWidth: 5)
                    .offset(y: Double(i) * circleOffset)
            }
        }
    }
    
    private let circleOffset: Double = -9
}

struct ChainAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ChainAnimation()
            .preferredColorScheme(.dark)
    }
}
