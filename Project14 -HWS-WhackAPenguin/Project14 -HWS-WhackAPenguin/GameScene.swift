//
//  GameScene.swift
//  Project14 -HWS-WhackAPenguin
//
//  Created by Ahuja, Abhishek on 5/8/22.
//

import SpriteKit

class GameScene: SKScene {
    var gameScore : SKLabelNode!
    var popupTime = 0.85
    var numRounds = 0
    var score = 0 {
        didSet {
            gameScore.text = "Score : \(score)"
        }
    }
    var slots = [WhackSlot]()



    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "whackBackground")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.blendMode = .replace
        background.zPosition = -1
        background.size = CGSize(width: self.size.width, height: self.size.height)
        addChild(background)
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score : 0"
        gameScore.position = CGPoint(x: 10 , y: 10)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 48
        addChild(gameScore)
        for i in 0 ..< 5 { createSlot(at: CGPoint(x: 100 + (i * 170), y: 410)) }
        for i in 0 ..< 4 { createSlot(at: CGPoint(x: 180 + (i * 170), y: 320)) }
        for i in 0 ..< 5 { createSlot(at: CGPoint(x: 100 + (i * 170), y: 230)) }
        for i in 0 ..< 4 { createSlot(at: CGPoint(x: 180 + (i * 170), y: 140)) }
        // Get label node from scene and store it for use later
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.createEnemy()
        }
    }
    func createSlot(at position : CGPoint) {
        let slot = WhackSlot()
        slot.configure(at: position)
        addChild(slot)
        slots.append(slot)
    }
    func createEnemy() {
        numRounds += 1
        if numRounds >= 30 {
            for slot in slots {
                slot.hide()

            }
            let gameOver = SKSpriteNode(imageNamed: "gameOver")
            gameOver.position = CGPoint(x: 512, y: 384)
            gameOver.zPosition = 1
            addChild(gameOver)

            return
        }
        popupTime *= 0.991
        slots.shuffle()
        slots[0].show(hideTime: popupTime)
        if Int.random(in: 0...12) > 4 { slots[1].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 8 {  slots[2].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 10 { slots[3].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 11 { slots[4].show(hideTime: popupTime)  }

        let minDelay = popupTime / 2.0
        let maxDelay = popupTime * 2
        let delay = Double.random(in: minDelay...maxDelay)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            [weak self] in self?.createEnemy()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch  = touches.first else {return}
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)

        for node in tappedNodes {
            guard let whackSlot = node.parent?.parent as? WhackSlot else { continue }
            if !whackSlot.isVisible { continue }
            if whackSlot.isHit { continue }

            if node.name == "charFriend" {
                whackSlot.hit()
                score -= 5
                run(SKAction.playSoundFileNamed("whackBad.caf", waitForCompletion:false))
            } else if node.name == "charEnemy" {


                guard let charNode = whackSlot.charNode else {return }
                charNode.xScale = 0.85
                charNode.yScale = 0.85
                whackSlot.hit()
                score += 1
                run(SKAction.playSoundFileNamed("whack.caf", waitForCompletion:false))
                
            }
        }
    }
}
