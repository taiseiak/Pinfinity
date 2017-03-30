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
    private var lastUpdateTime : TimeInterval = 0
    
    override func didMove(to view: SKView) {
        self.lastUpdateTime = 0
        setUp()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        let leftFlipper = staticObject?.leftFlipper
        let rightFlipper = staticObject?.rightFlipper
        leftFlipper?.update()
        rightFlipper?.update()
        
        if ((originalBall?.position.y)! < (staticObject?.position.y)! - CGFloat(350)) {
            originalBall?.position = (staticObject?.position)!
            originalBall?.physicsBody?.isDynamic = false
        }
        
        let moveLine = (staticObject?.position.y)! + CGFloat(200)
        
        if ((originalBall?.position.y)! > moveLine) {
            staticObject?.position = CGPoint(x: CGFloat(0), y: (originalBall?.position.y)! - CGFloat(200))
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
