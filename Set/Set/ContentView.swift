//
//  ContentView.swift
//  Set
//
//  Created by Ahuja, Abhishek on 6/12/22.
//

import SwiftUI

struct ContentView: View {

    let viewModel : StandardSetViewModel = StandardSetViewModel(gameModel: GameModel(cards: StandardSetViewModel.createStandardGameCards()))

    var body: some View {
        VStack {
            Text("SET")
            ScrollView {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(viewModel.cards) {
                card in
                CardView(card: card)
            }
    }
        }
        }
        .padding()
    }
}



struct CardView : View {
    var card: Card<StandardShapeTypes, StandardShadeTypes>
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 20, style: .circular)
            .stroke(.blue, lineWidth: 2)
            .foregroundColor(.white)
            .aspectRatio(2 / 3, contentMode: .fit)
            VStack {
            ForEach(0..<card.countOfShape) { _ in
                create(card: card)
            }
        }

    }
    }
    @ViewBuilder func create(card : Card<StandardShapeTypes, StandardShadeTypes>) -> some View {
    if card.shape == .diamond {
         Text("diamond")
    }
    if card.shape == .oval {
         Ellipse()
            .fill(card.color)
            .frame(width: 100, height: 50)
    }
    if card.shape == .squiggle {
        if card.shading == .filled {
         Rectangle()
            .fill(card.color)
            .zIndex(2)
            .frame(width: 50, height: 50)
        }
        if card.shading == .empty {
             Rectangle()
                .stroke(card.color)
                .zIndex(2)
                .frame(width: 50, height: 50)
            }
    if card.shading == .lines {
         Rectangle()
            .fill(card.color)
            .opacity(0.4)
            .zIndex(2)
            .frame(width: 50, height: 50)
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
