//
//  GameViewModel.swift
//  Set
//
//  Created by Ahuja, Abhishek on 6/12/22.
//

import Foundation
import SwiftUI

public enum StandardShapeTypes : CaseIterable {
    case diamond
    case oval
    case squiggle
}
public enum StandardShadeTypes : CaseIterable {
    case filled
    case empty
    case lines
}

public class StandardSetViewModel {
    public static let allowedColors : [Color]  = [.red, .purple, .green]
    private var gameModel : GameModel<StandardShapeTypes, StandardShadeTypes>
    public static func createStandardGameCards() -> [Card<StandardShapeTypes, StandardShadeTypes>] {
            var allCards : [Card<StandardShapeTypes, StandardShadeTypes>] = []
        var index = 0
        for shape in StandardShapeTypes.allCases {
            for count in 1...3 {
            for color in allowedColors {
                for shading in StandardShadeTypes.allCases {
                    allCards.append(Card(id : index, shape: shape, countOfShape: count, color: color, shading: shading))
                    index+=1
                }
            }
        }

        }
        return allCards
    }
    public var cards : [Card<StandardShapeTypes, StandardShadeTypes>] {
        return gameModel.cards
    }
    public init(gameModel :  GameModel<StandardShapeTypes, StandardShadeTypes> ) {
        self.gameModel = gameModel
    }
}
