//
//  WhackSlot.swift
//  Project14 -HWS-WhackAPenguin
//
//  Created by Ahuja, Abhishek on 5/8/22.
//
import SpriteKit
import UIKit

class WhackSlot: SKNode {
    var charNode : SKSpriteNode?
    var isVisible  = false
    var isHit =  false

    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(at Position : CGPoint) {
        self.position  = Position
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
         cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        self.charNode = SKSpriteNode(imageNamed: "penguinGood")
        guard let charNode = charNode else {
            return
        }
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        addChild(cropNode)
    }
    func show(hideTime : Double) {
        if isVisible {return }
        guard let charNode = charNode else {
            return
        }
        charNode.xScale = 1
        charNode.yScale = 1
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        isVisible = true
        isHit = false
        if Int.random(in: 0...2) == 0 {
               charNode.texture = SKTexture(imageNamed: "penguinGood")
               charNode.name = "charFriend"
           } else {
               charNode.texture = SKTexture(imageNamed: "penguinEvil")
               charNode.name = "charEnemy"
           }
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)) { [weak self] in
            self?.hide()
        }
    }

    func hide() {
        if !isVisible { return }
        guard let charNode = charNode else {
            return
        }
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        isVisible = false
    }
    func hit() {
        isHit = true
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.5)
        let notVisible = SKAction.run {
            [unowned self] in self.isVisible = false
        }
        guard let charNode = charNode else {
            return
        }
        charNode.run(SKAction.sequence([delay, hide, notVisible]))
    }
}
