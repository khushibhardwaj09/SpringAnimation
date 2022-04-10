//
//  MenuButtonAnimation.swift
//  SpringAnimation
//
//  Created by Rahul Narayanan on 4/9/22.
//

import SwiftUI

struct MenuButtonAnimation: View {
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: isPressed ? 0 : 1)
                .stroke()
                .frame(width: 85, height: 85)
                .animation(.spring(), value: isPressed)
            VStack {
                Group {
                    Rectangle()
                        .rotation(.degrees(isPressed ? 48 : 0), anchor: .leading)
                    Rectangle()
                        .scaleEffect(isPressed ? 0 : 1, anchor: isPressed ? .trailing : .leading)
                        .opacity(isPressed ? 0 : 1)
                    Rectangle()
                        .rotation(.degrees(isPressed ? -48 : 0), anchor: .leading)
                }
                .frame(height: 10)
            }
            .frame(width: 50, height: 50, alignment: .center)
            .onTapGesture {
                withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)) { // .spring() can be used
                    isPressed.toggle()
                }
        }
        }
    }
}

struct MenuButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuButtonAnimation(isPressed: false)
            MenuButtonAnimation(isPressed: true)
        }
    }
}
