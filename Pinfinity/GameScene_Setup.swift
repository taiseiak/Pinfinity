//
//  GameScene_Setup.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/29/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    
    func setUp() {
        setupOriginalBall()
        setupStaticObject()
    }
    
    func setupOriginalBall() {
        
        if let ball: Ball = self.childNode(withName: "Original Ball") as? Ball {
            originalBall = ball
        }
    }
    
    func setupStaticObject() {
        if let st: StaticObject = self.childNode(withName: "Statics") as? StaticObject {
            staticObject = st
            staticObject?.setup()
        }
    }

}
