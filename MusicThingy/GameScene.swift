//
//  GameScene.swift
//  MusicThingy
//
//  Created by jgoble52 on 8/28/16.
//  Copyright (c) 2016 tangital. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var ballTimer: Double = 0.0
    var dispenser = SKSpriteNode(imageNamed: "ballDispenser")
    var currentLine: SKShapeNode?
    var lineStartLocation: CGPoint?
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.whiteColor()
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -5.0)
        
        dispenser.size = CGSize(width: 50.0, height: 50.0)
        dispenser.position = CGPoint(x: CGRectGetMidX(frame), y: frame.height - 10.0)
        dispenser.physicsBody?.affectedByGravity = false
        addChild(dispenser)
        dispenser.zPosition = 10
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        if currentLine == nil {
            let touchStart = touches.first!.locationInNode(self)
            lineStartLocation = touchStart
            
            currentLine = SKShapeNode(rect: CGRect(origin: touchStart, size: CGSize(width: 5.0, height: 5.0)))
            currentLine?.strokeColor = SKColor.redColor()
            currentLine?.lineWidth = 5.0
            addChild(currentLine!)
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let currentLine = currentLine, lineStartLocation = lineStartLocation else {
            return
        }
        
        let touchLocation = touches.first!.locationInNode(self)
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, lineStartLocation.x, lineStartLocation.y)
        CGPathAddLineToPoint(path, nil, touchLocation.x, touchLocation.y)
        
        currentLine.path = path
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let currentLine = currentLine, let path = currentLine.path else {
            return
        }
        
        currentLine.physicsBody = SKPhysicsBody(edgeChainFromPath: path)
        currentLine.physicsBody?.affectedByGravity = false
        currentLine.physicsBody?.dynamic = false
        
        self.currentLine = nil
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if ballTimer > 120.0 {
            
            let ball = SKSpriteNode(imageNamed: "blueBall")
            ball.size = CGSize(width: 40.0, height: 40.0)
            ball.position = dispenser.position
            ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
            
            ball.physicsBody?.affectedByGravity = true
            ball.physicsBody?.dynamic = true
            addChild(ball)
            ball.zPosition = 9
            
            ballTimer = 0.0
            
        } else {
            
            ballTimer += 1
        }
    }
    
    
    
    
    
    
    
    
}
