//
//  Jar.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 31/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class Jar: SKSpriteNode {
    
    static let ORIGINAL_WIDTH: CGFloat = 50
    static let ORIGINAL_HEIGHT: CGFloat = 54
    
    static let WIDTH: CGFloat = 1024
    static let HEIGHT: CGFloat = 768
    
    private var _appear = false
    
    var appear: Bool {
        get {
            return _appear
        } set {
            _appear = newValue
        }
    }
    
    convenience init() {
        self.init(imageNamed: "Honey")
        self.size = CGSizeMake(self.size.width, self.size.height)
        getRandomPos()
        self.zPosition = 3
        self.name = "Jar"
        colliders()
        startMoving()
    }
    
    
    func getRandomPos() {
        let randomX = CGFloat(arc4random_uniform(400) + 300)
        self.position = CGPointMake(randomX, 768)
        print(self.position)
    }
    
    func startMoving() {
        let moveAction = SKAction.moveByX(0, y: -3.5, duration: 0.04)
        let moveForever = SKAction.repeatActionForever(moveAction)
        self.runAction(moveForever)
    }
    
    func colliders() {
        let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width * 0.9, self.size.height * 0.9), center: CGPointMake(0, 0))
        collider.contactTestBitMask = GameManager.sharedInstance.COLLIDER_BEE
        collider.categoryBitMask = GameManager.sharedInstance.COLLIDER_JAR_ROCK
        collider.collisionBitMask = 0
        self.physicsBody = collider
        self.physicsBody?.dynamic = true
    }
    
    override func update() {
        if self.position.y < -50 {
            if self.parent != nil {
                self.removeFromParent()
                self.removeAllActions()
                self._appear = false
            }
        }
    }
    
    
}
