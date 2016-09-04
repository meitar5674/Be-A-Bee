//
//  Stones.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 31/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class Stones: SKSpriteNode {
    
    static let RESET_Y_POINT: CGFloat = -200
    static let START_POINT: CGFloat = 1024
    
    private var _rockSpeed: CGFloat = 2.5
    
    var rockSpeed: CGFloat {
        get {
            return _rockSpeed
        } set {
            _rockSpeed = newValue
        }
    }
    

    
    convenience init() {
        let random = Int(arc4random_uniform(4))
        self.init(imageNamed: "Rock\(random + 1)")
        self.name = "Rock"
        setRockSize(random)
        self.zPosition = 6
        self.startMoving(_rockSpeed)
        colliders()
    }
    
    func startMoving(rockSpeed: CGFloat) {
        let moveAction = SKAction.moveByX(0, y: -rockSpeed, duration: 0.04)
        let moveForever = SKAction.repeatActionForever(moveAction)
        let randomX = CGFloat(arc4random_uniform(400) + 300)
        self.position = CGPointMake(randomX, 768)
        self.runAction(moveForever)
    }
    
    override func update() {
        if self.position.y <= Clouds.RESET_Y_POINT{
            didExceedBounds()
        }
    }
    
    func didExceedBounds() {
        let randomX = CGFloat(arc4random_uniform(400) + 300)
        self.position = CGPointMake(randomX, 768)
        getRandomRock()
        self.removeAllActions()
        if _rockSpeed <= 5 {
            _rockSpeed += 0.2
        }
        
        self.startMoving(_rockSpeed)
    }
    
    func getRandomRock() {
       let random = Int(arc4random_uniform(4))
       self.texture = SKTexture(imageNamed: "Rock\(random + 1)")
        setRockSize(random)
    }
    
    func setRockSize(random: Int) {
        switch random {
        case 0:
            self.size = CGSizeMake(423 / 5, 297 / 5)
        case 1:
            self.size = CGSizeMake(461 / 5, 335 / 5)
        case 2:
            self.size = CGSizeMake(404 / 5 , 313 / 5)
        case 3:
            self.size = CGSizeMake(413 / 5, 298 / 5)
        default:
            print("Oops")
        }
    }
    
    func colliders() {
        let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width * 0.9, self.size.height * 0.9), center: CGPointMake(0, 0))
        collider.contactTestBitMask = GameManager.sharedInstance.COLLIDER_BEE
        collider.categoryBitMask = GameManager.sharedInstance.COLLIDER_JAR_ROCK
        collider.collisionBitMask = 0
        self.physicsBody = collider
        self.physicsBody?.dynamic = true
    }

}
