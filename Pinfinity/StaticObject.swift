//
//  Static.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/29/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

class StaticObject: SKNode {
    
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

    
    func setup() {
        setupRightFlipper()
        setupLeftFlipper()
        setupScore()
        setupCoinScore()
        setupEdges()
        setupFlipperStopper()
        setupFlipperJoints()
    }
    
    func setupFlipperJoints(){
        let rightFlipperAnchor = SKNode()
        rightFlipperAnchor.position = (rightFlipper?.position)!
        rightFlipperAnchor.physicsBody = SKPhysicsBody()
        rightFlipperAnchor.physicsBody?.isDynamic = false
        rightFlipperAnchor.zRotation = (rightFlipper?.zRotation)!
        addChild(rightFlipperAnchor)
        
        let rightPinJoint = SKPhysicsJointPin.joint(withBodyA: rightFlipperAnchor.physicsBody!, bodyB: (rightFlipper?.physicsBody)!, anchor: rightFlipperAnchor.position)
        rightPinJoint.shouldEnableLimits = true
        rightPinJoint.lowerAngleLimit = -1.047199999891
        rightPinJoint.upperAngleLimit = 1.047199999891
        //rightPinJoint.rotationSpeed = 0.01
        self.scene?.physicsWorld.add(rightPinJoint)
        
        let leftFlipperAnchor = SKNode()
        leftFlipperAnchor.position = (leftFlipper?.position)!
        leftFlipperAnchor.physicsBody = SKPhysicsBody()
        leftFlipperAnchor.physicsBody?.isDynamic = false
        leftFlipperAnchor.zRotation = (leftFlipper?.zRotation)!
        addChild(leftFlipperAnchor)
        
        let leftPinJoint = SKPhysicsJointPin.joint(withBodyA: leftFlipperAnchor.physicsBody!, bodyB: (leftFlipper?.physicsBody)!, anchor: leftFlipperAnchor.position)
        leftPinJoint.shouldEnableLimits = true
        leftPinJoint.lowerAngleLimit = -1.047199999891
        leftPinJoint.upperAngleLimit = 1.047199999891
        //leftPinJoint.rotationSpeed = 0.01
        self.scene?.physicsWorld.add(leftPinJoint)
    }
    
    
    func setupEdges() {
        let topRight = CGPoint(x: 187.5, y: 333.5)
        let topLeft = CGPoint(x: -187.4, y: 333.5)
        let bottomRight = CGPoint(x: 187.5, y: -333.5)
        let bottomLeft = CGPoint(x: -187.4, y: -333.5)
        
        let rightEdge = SKNode()
        rightEdge.physicsBody = SKPhysicsBody(edgeFrom: topRight, to: bottomRight)
        
        let leftEdge = SKNode()
        leftEdge.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: bottomLeft)
        
        addChild(rightEdge)
        addChild(leftEdge)
    }
    
    func setupCoinScore() {
        if let coinScore_: SKLabelNode = self.childNode(withName: "Coin Score") as? SKLabelNode{
            coinLabel = coinScore_
            
            coinScore = 0
        }
    }
    
    func setupScore() {
        if let score_: SKLabelNode = self.childNode(withName: "Score") as? SKLabelNode{
            scoreLabel = score_
            
            score = 0
        }
    }
    
    func setupRightFlipper() {
        if let flipper: Flipper = self.childNode(withName: "Right Flipper") as? Flipper {
            rightFlipper = flipper
            //rightFlipper?.initialPos = (rightFlipper?.position)!
        }
    }
    
    func setupLeftFlipper() {
        if let flipper: Flipper = self.childNode(withName: "Left Flipper") as? Flipper {
            leftFlipper = flipper
            //leftFlipper?.initialPos = (leftFlipper?.position)!
        }
    }
    
    func setupFlipperStopper() {
        if let stopper: SKSpriteNode = self.childNode(withName: "Flipper Stopper") as? SKSpriteNode {
            flipperStopper = stopper
        }
    }

    
}
