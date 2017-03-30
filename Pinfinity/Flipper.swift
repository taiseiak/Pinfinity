//
//  Flipper.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/25/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

class Flipper: SKSpriteNode {
    
    let rotateTo30: SKAction = SKAction(named: "RotateTo30")!
    let rotateToNeg30: SKAction = SKAction(named: "RotateToNeg30")!
    let playFlipperUp: SKAction = SKAction.playSoundFileNamed("FlipperUp", waitForCompletion: false)
    let playFlipperDown: SKAction = SKAction.playSoundFileNamed("FlipperDown", waitForCompletion: false)
    
    var alreadyUp: Bool = false
    
    func update() {
        if (alreadyUp && self.zRotation == 0.52) {
            self.lockFlipperUp(onSide: "left")
        } else if  (alreadyUp && self.zRotation == -0.52) {
            self.lockFlipperUp(onSide: "right")
        }
    }
    
    func flipperMoveUp(onSide side: String) {
        switch side{
        case "Left", "left":
            alreadyUp = false
            self.physicsBody?.isDynamic = true
            self.physicsBody?.allowsRotation = true
            self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            self.physicsBody?.angularVelocity = 0
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 2500))
            self.lockFlipperUp(onSide: side)
            self.run(playFlipperUp)
            
        case "Right", "right":
            alreadyUp = false
            self.physicsBody?.isDynamic = true
            self.physicsBody?.allowsRotation = true
            self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            self.physicsBody?.angularVelocity = 0
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 2500))
            self.lockFlipperUp(onSide: side)
            self.run(playFlipperUp)
        default:
            break
        }
    }
    
    func flipperMoveDown(onSide side: String) {
        switch side{
        case "Left", "left":
            alreadyUp = false
            self.physicsBody?.isDynamic = true
            self.physicsBody?.allowsRotation = true
            self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            self.physicsBody?.angularVelocity = 0
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -1000))
            self.lockFlipperDown(onSide: side)
            self.run(playFlipperDown)
            
        case "Right", "right":
            alreadyUp = false
            self.physicsBody?.isDynamic = true
            self.physicsBody?.allowsRotation = true
            self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            self.physicsBody?.angularVelocity = 0
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -1000))
            self.lockFlipperDown(onSide: side)
            self.run(playFlipperDown)
        default:
            break
        }
    }
    
    func lockFlipperUp(onSide side: String) {
        switch side{
        case "left", "Left":
            let lockFlipperAction: SKAction = SKAction.run {
                self.zRotation = 0.523599
                self.lockFlipper()
            }
            self.run(SKAction.sequence([rotateTo30, lockFlipperAction]))
        
        
        case "right", "Right":
            let lockFlipperAction: SKAction = SKAction.run {
                self.zRotation = -0.523599
                self.lockFlipper()
            }
            self.run(SKAction.sequence([rotateToNeg30, lockFlipperAction]))
            
        default:
            break
        }
        
        
    }
    
    func lockFlipperDown(onSide side: String) {
        self.physicsBody?.angularVelocity = 0
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        switch side{
        case "left", "Left":
            let lockFlipperAction: SKAction = SKAction.run {
                self.zRotation = -0.523599
                self.lockFlipper()
            }
            self.run(SKAction.sequence([rotateToNeg30, lockFlipperAction]))
            
            
        case "right", "Right":
            let lockFlipperAction: SKAction = SKAction.run {
                self.zRotation = 0.523599
                self.lockFlipper()
            }
            
            self.run(SKAction.sequence([rotateTo30, lockFlipperAction]))
            
        default:
            break
        }
        
    }
    
    func lockFlipper() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        self.physicsBody?.angularVelocity = 0
    }
    
}
