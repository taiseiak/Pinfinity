//
//  GameScene.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/22/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
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
    
    override func didMove(to view: SKView) {
        setUp()
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func moveOriginalBall(toPoint pos : CGPoint) {
        originalBall?.position = pos
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        if(pos.x < -3){
            leftFlipper?.flipperMoveUp(onSide: "Left")
            score += 1
        } else if (pos.x > 3) {
            rightFlipper?.flipperMoveUp(onSide: "Right")
            coinScore += 1
        }
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if(pos.x < -3){
            leftFlipper?.flipperMoveDown(onSide: "Left")
        } else if (pos.x > 3) {
            rightFlipper?.flipperMoveDown(onSide: "Right")
        } else {
            rightFlipper?.playDownSound()
        }
        
        if (pos.x > 0 && pos.y > 0) {
            moveOriginalBall(toPoint: pos)
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
        if (pos.x >= -3 && pos.x <= 3) {
            leftFlipper?.flipperMoveDownNoSound(onSide: "Left")
            rightFlipper?.flipperMoveDownNoSound(onSide: "Right")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        
        /*let touch = touches.first
        let location = touch?.location(in: self).x as! Float
        
        if (location? >= -3.0 && location? <= 3.0) {
            leftFlipper?.flipperMoveDownNoSound(onSide: "Left")
            rightFlipper?.flipperMoveDownNoSound(onSide: "Right")
        }*/
    }
    
    
    func setUp() {
        setupRightFlipper()
        setupLeftFlipper()
        setupScore()
        setupCoinScore()
        setupEdges()
        setupOriginalBall()
    }
    
    func setupOriginalBall() {
        if let ball: Ball = self.childNode(withName: "Original Ball") as? Ball {
            originalBall = ball
        }
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
        }
    }
    
    func setupLeftFlipper() {
        if let flipper: Flipper = self.childNode(withName: "Left Flipper") as? Flipper {
            leftFlipper = flipper
        }
    }
}
