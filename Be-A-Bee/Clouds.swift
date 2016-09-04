//
//  Clouds.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 30/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class Clouds: SKSpriteNode {
    
    static let RESET_Y_POINT: CGFloat = -200
    static let START_POINT: CGFloat = 1024
    
    static let ORIGINAL_WIDTH: CGFloat = 555
    static let ORIGINAL_HEIGHT: CGFloat = 331
    
    private var _cloudSpeed: CGFloat = 2.5
    
    var cloudSpeed: CGFloat {
        get {
            return _cloudSpeed
        } set {
            _cloudSpeed = newValue
        }
    }
 
    func startMoving(cloudSpeed: CGFloat) {
        let moveAction = SKAction.moveByX(0, y: -cloudSpeed, duration: 0.04)
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
        getRandomSize()
        self.removeAllActions()
        _cloudSpeed = _cloudSpeed + 0.2
        self.startMoving(_cloudSpeed)
    }
    
    convenience init() {
        self.init(imageNamed: "Cloud")
        self.zPosition = 4
         getRandomSize()
        self.startMoving(_cloudSpeed)
    }

    func getRandomSize() {
        let random = Int(arc4random_uniform(4))
        switch random {
        case 0:
            self.size = CGSizeMake(Clouds.ORIGINAL_WIDTH / 6, Clouds.ORIGINAL_HEIGHT / 6)
        case 1:
            self.size = CGSizeMake(Clouds.ORIGINAL_WIDTH / 5, Clouds.ORIGINAL_HEIGHT / 5)
        case 2:
            self.size = CGSizeMake(Clouds.ORIGINAL_WIDTH / 7, Clouds.ORIGINAL_HEIGHT / 7)
        case 3:
            self.size = CGSizeMake(Clouds.ORIGINAL_WIDTH / 8, Clouds.ORIGINAL_HEIGHT / 8)
        default:
            print("Weird")
        }
    }
    
}
