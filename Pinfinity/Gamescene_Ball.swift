//
//  Gamescene_Ball.swift
//  Pinfinity
//
//  Created by Taisei Klasen on 3/29/17.
//  Copyright © 2017 Klasen. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    func moveOriginalBall(toPoint pos : CGPoint) {
        originalBall?.position = pos
        originalBall?.physicsBody?.isDynamic = true
    }
    
}
