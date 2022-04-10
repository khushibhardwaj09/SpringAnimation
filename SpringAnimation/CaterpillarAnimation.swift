//
//  ChainAnimation.swift
//  SpringAnimation
//
//  Created by Rahul Narayanan on 4/3/22.
//

import SwiftUI

struct CaterpillarAnimation: View {
    
    @State private var gestureOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            ForEach(0..<12) { i in
                ZStack(alignment: .top) {
                    Circle()
    //                    .stroke(lineWidth: 5)
                        .foregroundColor(.lightGreen) //from the extension
                    if i == 0 {
                        HStack {
                            Group {
                                Circle()
                                Circle()
                            }
                            .frame(width: 8, height: 8)
                            .offset(y: 10)
                        }
                        .foregroundColor(.black)
                    }
                }
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

struct Previews_CaterpillarAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CaterpillarAnimation()
            .preferredColorScheme(.dark)
    }
}
