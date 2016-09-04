//
//  BeeGameScene.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 30/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit
import Darwin // for Math functions

class BeeGameScene: SKScene, SKPhysicsContactDelegate {
    
    var back: SKSpriteNode!
    var moon: Moon!
    
    var stars = [Stars]()
    var clouds = [Clouds]()
    var rocks = [Stones]()
    
    var jar: Jar!
    var bee: Bee!
    
    var count = 0
    
    var newPos: CGPoint!
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        setBack()
        setBee()
        setMoon()
        setClouds()
        setStars()
        setRocks()
        setJar()
    }
    
    override func update(currentTime: NSTimeInterval) {
        for cloud in clouds {
            cloud.update()
        }
        
        for rock in rocks {
            rock.update()
        }
        
        if jar.parent == nil && !jar.appear {
            newJar()
        }
        
        if newPos != nil {
            animateBeeMovement()
        }
        
        jar.update()
    }
    
    func setBack() {
        back = SKSpriteNode(imageNamed: "beeGameBack")
        back.size = CGSizeMake(1050, 1050)
        back.position = CGPointMake(self.size.width / 2 , self.size.height / 2)
        back.zPosition = 1
        self.addChild(back)
    }
    
    func setBee() {
        bee = Bee()
        self.addChild(bee)
    }
    
    func setMoon() {
        moon = Moon()
        self.addChild(moon)
    }
    
    func setJar() {
        jar = Jar()
        self.addChild(jar)
    }
    
    func setStars() {
        for x in 0...6 {
            switch x {
            case 0:
                stars.append(Stars(pos: CGPointMake(self.size.width / 2 - 230, self.size.height - 90)))
            case 1:
                stars.append(Stars(pos: CGPointMake(self.size.width / 2 + 40, self.size.height - 200)))
            case 2:
                stars.append(Stars(pos: CGPointMake(self.size.width / 2 + 140, self.size.height - 200)))
            case 3:
                stars.append(Stars(pos: CGPointMake(self.size.width / 2 - 160, self.size.height - 250)))
            case 4:
                stars.append(Stars(pos: CGPointMake(self.size.width / 2 - 100, self.size.height - 180)))
            case 5:
                 stars.append(Stars(pos: CGPointMake(self.size.width / 2 , self.size.height - 90)))
            case 6:
                 stars.append(Stars(pos: CGPointMake(self.size.width / 2 + 120, self.size.height - 90)))
                
            default:
                print("Oops")
            }
            self.addChild(stars[x])
        }
    }
    
    func newJar() {
        if jar.parent == nil {
            jar.appear = true
            let wait = SKAction.waitForDuration(2)
            self.runAction(wait, completion: { () -> Void in
                self.addChild(self.jar)
                self.jar.getRandomPos()
                self.jar.startMoving()
            })
        }
    }
    
    func setClouds() {
        for x in 0...4 {
            let wait = SKAction.waitForDuration(Double(x) * 2)
            self.runAction(wait, completion: { () -> Void in
                let cloud = Clouds()
                self.clouds.append(cloud)
                self.addChild(cloud)
                cloud.startMoving(2)
            })
        }
    }
    
    func setRocks() {
        for x in 0...2 {
            let wait = SKAction.waitForDuration(Double(x + 1) * 3.5)
            self.runAction(wait, completion: { () -> Void in
                let rock = Stones()
                self.rocks.append(rock)
                self.addChild(rock)
                rock.startMoving(2)
            })
        }
    }
    
    func animateBeeMovement() {
        
        let deltaX = newPos.x - bee.position.x
        let deltaY = newPos.y - bee.position.y
        
        let superFullMovementTime: CGFloat = 22
        let fullMovementTime: CGFloat = 14
        let halfMovementTime: CGFloat = 10
        let minimumMovementTime: CGFloat = 6

        let distance: CGFloat = sqrt(pow(deltaX, 2) + pow(deltaY, 2))
        
        var movementTime: CGFloat = 0
        
        if distance >= 500 {
            movementTime = superFullMovementTime
        }
        
        if distance >= 300 && distance < 500 {
            movementTime = fullMovementTime
        }
        
        if distance >= 200 && distance < 300{
            movementTime = halfMovementTime
        }
        
        if distance < 200 {
            movementTime = minimumMovementTime
        }
        
        let additionalX = deltaX / movementTime
        let additionalY = deltaY / movementTime
        
        if deltaX > 10 || deltaX < -10 {
            bee.position.x = bee.position.x + additionalX
        }
        
        if deltaY > 10 || deltaY < -10 {
            bee.position.y = bee.position.y + additionalY
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
            let nameA = nodeA.name!
            let nameB = nodeB.name!
            
            if nameA == "Bee" && nameB == "Rock" || nameA == "Rock" && nameB == "Bee" {
                print("Game Over")
                NSUserDefaults.standardUserDefaults().setValue(count, forKey: "lastCountJars")
                NSUserDefaults.standardUserDefaults().synchronize()
                goToGameOverScene()
                // Game Over Scene
            }
            
            if nameA == "Bee" && nameB == "Jar" || nameB == "Bee" && nameA == "Jar" {
                count += 1
                if jar.parent != nil {
                    jar.removeFromParent()
                    jar.appear = false
                    jar.removeAllActions()
                }
                if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
                    print(jars)
                    NSUserDefaults.standardUserDefaults().setValue(jars + 1, forKey: "jars")
                    NSUserDefaults.standardUserDefaults().synchronize()
                } else {
                    NSUserDefaults.standardUserDefaults().setValue(1, forKey: "jars")
                    NSUserDefaults.standardUserDefaults().synchronize()
                }
            }
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if location.x > 250 && location.x < 750 && location.y < 800 && location.y >= 100{
                newPos = location
            }
        }
    }
    
    func goToGameOverScene() {
        let gameOverScene: GameOverScene = GameOverScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        gameOverScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(gameOverScene, transition: transition)
    }
  
}
