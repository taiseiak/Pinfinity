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
    var touch: Bool = false
    
    func flipperMoveUp(onSide side: String) {
        switch side{
        case "Left", "left":
            self.run(rotateTo30)
            self.run(playFlipperUp)
            
        case "Right", "right":
            self.run(rotateToNeg30)
            self.run(playFlipperUp)
            
        default:
            break
        }
    }
    
    func flipperMoveDown(onSide side: String) {
        switch side{
        case "Left", "left":
            self.run(rotateToNeg30)
            self.run(playFlipperDown)
            
        case "Right", "right":
            self.run(rotateTo30)
            self.run(playFlipperDown)
            
        default:
            break
        }
    }
    
    func flipperMoveDownNoSound(onSide side: String) {
        
        switch side {
        case "Left", "left":
            self.run(rotateToNeg30)
            
        case "Right", "right":
            self.run(rotateTo30)

        default:
            break
        }
        
    }
    
    func playDownSound() {
        self.run(playFlipperDown)
    }
    
    func flipperMove(onSide side: String) {
        switch side{
        case "Left", "left":
            if touch {
                self.run(rotateTo30)
                self.run(playFlipperUp)
            } else {
                self.run(rotateToNeg30)
                self.run(playFlipperDown)
            }
            
        case "Right", "right":
            if touch {
                self.run(rotateToNeg30)
                self.run(playFlipperUp)
            } else {
                self.run(rotateTo30)
                self.run(playFlipperDown)
            }
        
        default:
            return
        }
        
    }
    
}
