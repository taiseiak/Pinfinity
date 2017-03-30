//
//  GameScene_Touch.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/29/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    /*func touchDown(atPoint pos : CGPoint) {
        
        if(pos.x < 0){
            leftFlipper?.flipperMoveUp(onSide: "Left")
            score += 1
        } else if (pos.x > 0) {
            rightFlipper?.flipperMoveUp(onSide: "Right")
            coinScore += 1
        }
        
    }*/
    
    /*func touchUp(atPoint pos : CGPoint) {
        
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
        
    }*/
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            if (t.location(in: self).x < 0) {
                touchedLeft()
            } else if (t.location(in: self).x > 0) {
                touchedRight()
            }
            
            if (t.location(in: self).x > 0 && t.location(in: self).y > 0) {
                moveOriginalBall(toPoint: t.location(in: self))
                originalBall?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            }
            //self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    func touchedLeft() {
        leftFlipper?.flipperMoveUp(onSide: "Left")
        score += 1
    }
    
    func touchedRight() {
        rightFlipper?.flipperMoveUp(onSide: "Right")
        coinScore += 1
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if (t.location(in: self).x < 0) {
                letGoLeft()
            } else if (t.location(in: self).x > 0) {
                letGoRight()
            }
            //self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    func letGoLeft() {
        leftFlipper?.flipperMoveDown(onSide: "Left")
    }
    
    func letGoRight() {
        rightFlipper?.flipperMoveDown(onSide: "Right")
    }
    
    
    
    
    
    
    
    /*
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }*/
        
        /*let touch = touches.first
         let location = touch?.location(in: self).x as! Float
         
         if (location? >= -3.0 && location? <= 3.0) {
         leftFlipper?.flipperMoveDownNoSound(onSide: "Left")
         rightFlipper?.flipperMoveDownNoSound(onSide: "Right")
         }*/
}

