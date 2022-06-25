//
//  GameModel.swift
//  Set
//
//  Created by Ahuja, Abhishek on 6/12/22.
//

import Foundation
import SwiftUI

public struct GameModel<GameShape, GameShading> {
    public var cards : [Card<GameShape, GameShading>]

}
public struct Card<ShapeType, ShadeType> : Identifiable {
    public var id: Int
    public var shape: ShapeType
    public var countOfShape: Int
    public var color : Color
    public var shading: ShadeType
    public var isSelected: Bool = false
}
