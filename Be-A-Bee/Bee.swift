//
//  Bee.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 31/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit


class Bee: SKSpriteNode {
    
    static let WIDTH: CGFloat = 1024
    static let HEIGHT: CGFloat = 768
    
    convenience init() {
        self.init(imageNamed: "BeeAbove")
        self.size = CGSizeMake(self.size.width / 3, self.size.height / 3)
        self.position = CGPointMake(Bee.WIDTH / 2, 100 )
         self.name = "Bee"
        self.zPosition = 10
        collider()
    }
    
    func collider() {
        let collider = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width * 0.85, self.size.height * 0.9), center: CGPointMake(0, 0))
        collider.contactTestBitMask = GameManager.sharedInstance.COLLIDER_JAR_ROCK
        collider.categoryBitMask = GameManager.sharedInstance.COLLIDER_BEE
        collider.collisionBitMask = 0
        self.physicsBody = collider
        self.physicsBody?.dynamic = true
  }

}