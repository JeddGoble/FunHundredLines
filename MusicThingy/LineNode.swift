//
//  LineNode.swift
//  MusicThingy
//
//  Created by jgoble52 on 8/28/16.
//  Copyright © 2016 tangital. All rights reserved.
//

import UIKit
import SpriteKit

class LineNode: SKSpriteNode {

    class func createLineNode(width: CGFloat, rotation: CGFloat) -> SKSpriteNode {
        
        let line = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: width, height: 5.0))
        line.zRotation = 0.0
        line.physicsBody = SKPhysicsBody(rectangleOfSize: line.size)
        line.physicsBody?.affectedByGravity = false
        line.physicsBody?.dynamic = false
        
        return line
    }
    
    
}
