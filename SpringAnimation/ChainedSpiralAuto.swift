//  SwiftUI Spring Animations
//  Inspired by Amos from getstream.io
//

// Here's my mark

import SwiftUI

struct ChainedSpiralAuto: View {
    //1. Defining the initial animation state
        
    @Binding var colorEnabled: Bool
    @State var moving = false //initialisation of moving to false
    //@State var stiffness: Double = ChainedSpiralAuto.defaultChangingStiffness
    
    var body: some View {
        ZStack (alignment: .bottom) {
            ZStack{
                ForEach(0..<8) { index in
                    Circle() //. Defining the properties of the Circle view (for 8 circles)
                        .stroke(lineWidth: 5)
                        .frame(width: 20 + CGFloat(30*index), height: 20 + CGFloat(30*index))
                        .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                       .offset(y: moving ? 150 : -180) //to use if you want continuous ripple
                        .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses:                   true).delay(Double(index)*0.06), value: moving) //repeatforever
                        .foregroundColor(colorEnabled ? ContentView.circleColors[index] : .primary)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(RadialGradient(colors: ContentView.circleColors, center: .leading, startRadius: 0, endRadius: 0))
        }
        .onAppear {
            moving = true
        }

    }
    //Constants:
//    private static let defaultChangingStiffness: Double = 100
//    private static let defaultEndedStiffness: Double = 50
}

struct ChainedSpiralAuto_Previews: PreviewProvider {
    static var previews: some View {
        ChainedSpiralAuto(colorEnabled: .constant(true))
            .preferredColorScheme(.dark)
    }
}
