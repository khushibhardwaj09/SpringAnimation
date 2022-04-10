//
//  ContentView.swift
//  SpringAnimation
//
//  Created by  Khushi Bhardwaj on 3/13/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            SpringAnimationView()
                .tabItem {
                    Label("Spring", systemImage: "scribble.variable")
                }
            CircularMotionView()
                .tabItem {
                    Label("Ball", systemImage: "circle.circle")
                }
            CaterpillarAnimation()
                .tabItem {
                    Label("Chain", systemImage: "circle.hexagonpath")
                }
            RevolvingAnimation()
                .tabItem {
                    Label("Revolution", systemImage: "circle.grid.cross.down.fill")
                }
        }
        .tabViewStyle(.page)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
