//
//  SpringButtonStyle.swift
//Spring animation for buttons.
//
//  Created by  Khushi Bhardwaj on 4/9/22.
//

import SwiftUI

struct SpringButtonStyle: ButtonStyle { //must conform to protocol 'ButtonStyle'
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label //current configuration, the styles we add
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.spring(), value: configuration.isPressed)
            .padding(8)
            .background(.blue)
            .cornerRadius(9.0)
    }
}
