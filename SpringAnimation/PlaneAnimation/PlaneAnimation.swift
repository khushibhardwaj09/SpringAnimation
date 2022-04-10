//
//  PlaneAnimation.swift
//  SpringAnimation
//
//  Created by  Khushi Bhardwaj on 4/9/22.
//

import SwiftUI

struct PlaneAnimation: View {
    var body: some View {
        Button("Fly") {
        }
        .font(.largeTitle.bold())
        .buttonStyle(SpringButtonStyle())
    }
}

struct PlaneAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PlaneAnimation()
    }
}


