//
//  ContentView.swift
//  ViewModifierPracticeChallenge
//
//  Created by Lauren Kwee on 7/31/20.
//  Copyright © 2020 Lauren Kwee. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier{
    func body(content: Content) -> some View{
        content
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View{
    func blueBubble() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
        .blueBubble()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
