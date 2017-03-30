//
//  GameScene.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/22/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var rightFlipper : Flipper?
    var leftFlipper : Flipper?
    var scoreLabel : SKLabelNode?
    var score : Int = 0 {
        didSet {
            scoreLabel?.text = "\(score)"
        }
    }
    var coinLabel : SKLabelNode?
    var coinScore : Int = 0 {
        didSet {
            coinLabel?.text = "\(coinScore)"
        }
    }
    var originalBall: Ball?
    var flipperStopper: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        setUp()
    }
    
    override func update(_ currentTime: TimeInterval) {
        leftFlipper?.update()
        rightFlipper?.update()
    }
    
    func moveOriginalBall(toPoint pos : CGPoint) {
        originalBall?.position = pos
    }
    
    /*func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 8) {
            if let flipper: Flipper = contact.bodyA.node as? Flipper {
                flipper.flipp
            }
        }
    }*/
}
