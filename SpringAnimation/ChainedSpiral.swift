//  SwiftUI Spring Animations
//  Inspired by Amos from getstream.io
//

// Here's my mark

import SwiftUI

struct ChainedSpiral: View {
    //1. Defining the initial animation state
    
    enum SpringMode { //Mode of the animation
        case auto   //Automatic operation
        case manual //Dragging
    }
    
    @State var mode: SpringMode = .manual
    @State var moving = false //initialisation of moving to false
    @State var gestureOffset: CGFloat = 0.0
    @State var stiffness: Double = defaultChangingStiffness
    
    var body: some View {
        ZStack (alignment: .bottom){
            ZStack{
                ForEach(0..<8) { index in
                    if (mode == .auto) {
                        Circle() //. Defining the properties of the Circle view (for 8 circles)
                            .stroke(lineWidth: 5)
                            .frame(width: 20 + CGFloat(30*index), height: 20 + CGFloat(30*index))
                            .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                           .offset(y: moving ? 150 : -180) //to use if you want continuous ripple
                            .offset(y: gestureOffset)
                            .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses:                   true).delay(Double(index)*0.05), value: moving) //repeatforever
                    } else {
                        Circle() //. Defining the properties of the Circle view (for 8 circles)
                            .stroke(lineWidth: 5)
                            .frame(width: 20 + CGFloat(30*index), height: 20 + CGFloat(30*index))
                            .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                            .offset(y: gestureOffset)
                            .animation(.interpolatingSpring(stiffness: 100, damping: 9).delay(Double(index) * 0.06), value: gestureOffset)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: mode, perform: { _ in
                moving = (mode == .auto)
            })
            .gesture(DragGesture().onChanged({ gesture in
                if (mode == .manual) {
                    stiffness = ChainedSpiral.defaultChangingStiffness
                    gestureOffset = gesture.translation.height //setting the offset value to drag height (y translation)
                }
            }).onEnded({gesture in
                if (mode == .manual) {
                    stiffness = ChainedSpiral.defaultEndedStiffness
                    gestureOffset = 0.0 //resetting offset (circles bounce back to the centre)
                }
            }))
            
            Button(mode == .auto ? "Auto" : "Manual") {
                mode = (mode == .auto) ? .manual : .auto
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .font(.system(size: 22, weight: .bold, design: .rounded))
        }

    }
    //Constants:
    private static let defaultChangingStiffness: Double = 100
    private static let defaultEndedStiffness: Double = 50
}

struct ChainedSpring_Previews: PreviewProvider {
    static var previews: some View {
        ChainedSpiral()
            .preferredColorScheme(.dark)
    }
}
