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
    
    
    var staticObject: StaticObject?
    /*
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
    var flipperStopper: SKSpriteNode?
 `*/
    
    var originalBall: Ball?
    var start: Bool = false
    
    override func didMove(to view: SKView) {
        staticObject?.score = 0
        start = false
        setUp()
    }
    
    override func update(_ currentTime: TimeInterval) {
        let moveLine = (staticObject?.position.y)! + CGFloat(250)
        let resetPosition = CGPoint(x: 0, y: -354)
        
        
        
        let leftFlipper = staticObject?.leftFlipper
        let rightFlipper = staticObject?.rightFlipper
        leftFlipper?.update()
        rightFlipper?.update()
        
        if ((originalBall?.position.y)! < (staticObject?.position.y)! - CGFloat(355)) {
            staticObject?.position = CGPoint(x: 0, y: 0)
            originalBall?.position = resetPosition
            originalBall?.physicsBody?.isDynamic = false
            staticObject?.score = 0
            start = false
        }
        
        
        
        if ((originalBall?.position.y)! > moveLine) {
            let dBall = Int(((originalBall?.position.y)! - moveLine))
            staticObject?.score += dBall
            staticObject?.position = CGPoint(x: CGFloat(0), y: (originalBall?.position.y)! - CGFloat(250))
        }
    }
    
    /*func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 8) {
            if let flipper: Flipper = contact.bodyA.node as? Flipper {
                flipper.flipp
            }
        }
    }*/
}
