//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Lauren Kwee on 7/30/20.
//  Copyright © 2020 Lauren Kwee. All rights reserved.
//

import SwiftUI

struct FlagImage: View{
    var imageName: String
    
    var body: some View{
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
        //.overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 4)
    }
}

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var currentCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint:.top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of...")
                        .foregroundColor(.white)
                    
                    Text(currentCountries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) {number in
                    Button(action:{
                        self.flagTapped(number)
                    }) {
                        FlagImage(imageName: self.currentCountries[number])
                    }
                }
                
                Text("Current score: \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Play again")) {
                    self.restartGame(self.correctAnswer)
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Correct!"
            score += 1
            askQuestion(correctAnswer)
        } else{
            scoreTitle = "Wrong! That's the flag of \(currentCountries[number])"
            showingScore = true
        }
    }
    
    func askQuestion(_ previousAnswer: Int) {
        let previousIndex = countries.firstIndex(of: currentCountries[previousAnswer]) ?? 0
        currentCountries = countries
        currentCountries.remove(at: previousIndex)
        currentCountries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame(_ previousAnswer: Int) {
        askQuestion(previousAnswer)
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
