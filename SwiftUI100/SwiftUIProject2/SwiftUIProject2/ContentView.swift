//
//  ContentView.swift
//  SwiftUIProject2
//
//  Created by Ahuja, Abhishek on 5/21/22.
//

import SwiftUI

//custom view created by swift ui
struct FlagImage : View {
    var imageName : String
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State var tapAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tries = 0
    @State private var gameCompletedAlert  = false

    var body: some View {
//Concepts for Project 2
//        ZStack {
////            VStack(spacing: 0) {
////                    Color.red
////                    Color.blue
////                }
////            Text("Your content")
////                .foregroundStyle(.secondary) // modifier on text not on zstack
////                    .padding(50)
////                    .background(.ultraThinMaterial)
////            LinearGradient(gradient: Gradient(stops: [
////                .init(color: .white, location: 0.45),
////                .init(color: .black, location: 0.55),
////               ]), startPoint: .top, endPoint: .bottom)
////            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//// BUTTONS
//            Button("Delete selection", role: .destructive) {
//                print("Now deleting…")
//            }
//        }
//        VStack {
//            Button("Button 1") {
//
//            }.buttonStyle(.bordered)
//            Button("Button 1", role: .destructive) {
//
//            }.buttonStyle(.bordered)
//            Button("Button 3") { }
//                   .buttonStyle(.borderedProminent)
//            Button("Button 4", role: .destructive) { }
//                   .buttonStyle(.borderedProminent)
//                   .tint(.mint)
//            Button {
//                print("Tapped on button 5")
//            } label: {
//                HStack {
//                    Image(systemName: "pencil")
//                    Text("Edit")
//                }
//            }
//        Button("Show Alert") {
//            showingAlert =  true
//        }
//        .alert("Important Message", isPresented: $showingAlert) {
//            Button("Delete", role: .destructive) { }
//               Button("Cancel", role: .cancel) { }
//        } message : {
//            Text("Please read this!!")
//        }
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color:  Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
        VStack(spacing: 15) {
        VStack {
            Text("Tap the Flag of")
                .blueTitle()
            Text(countries[correctAnswer])
                .font(.largeTitle.weight(.semibold))
        }
            ForEach(0..<3) { number in
                Button {
                    flagTapped(number)
                }
            label: {
                    FlagImage(imageName: countries[number])
                }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert("Game completed with Score : \(score)", isPresented: $gameCompletedAlert) {
                Button("Restart", action: resetGameState)
            }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
        Text("Score : \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
    }
    func flagTapped(_ index : Int) {
        if index == correctAnswer {
            scoreTitle = "You are a pro mate"
            score+=1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[index])"
            score-=1
        }
        tries+=1
        if tries == 6 {
            gameCompletedAlert = true
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func resetGameState() {
        score = 0
        scoreTitle = ""
        tries = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BlueTitle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.blue)
    }
}
extension View {
    func blueTitle() -> some View {
        modifier(BlueTitle())
    }
}
