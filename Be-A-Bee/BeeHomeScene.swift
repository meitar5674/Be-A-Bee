//
//  BeeHomeScene.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 26/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class BeeHomeScene: SKScene {
    
    var background: SKSpriteNode!
    var title: SKSpriteNode!
    var backBtn: SKSpriteNode!
    
    var bee: SKSpriteNode!
    
    var tie: SKSpriteNode!
    var decor: SKSpriteNode!
    var beard: SKSpriteNode!
    var glasses: SKSpriteNode!
    var hat: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        setBack()
        setTitle()
        setBtns()
        setBee()
        setItems()
    }
    
    func setBack() {
        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPointMake(self.size.width / 2, self.size.height / 2)
        background.zPosition = 1
        self.addChild(background)
    }
    
    func setTitle() {
        title = SKSpriteNode(imageNamed: "title")
        title.position = CGPointMake(self.size.width / 2, self.size.height - 185)
        title.zPosition = 2
        title.size = CGSizeMake(title.size.width * 0.95, title.size.height * 0.95)
        self.addChild(title)
    }
    
    func setBtns() {
        backBtn = SKSpriteNode(imageNamed: "Home")
        backBtn.size = CGSizeMake(491 / 4, 130 / 4)
        backBtn.position = CGPointMake(self.size.width / 2, 50)
        backBtn.zPosition = 2
        self.addChild(backBtn)
    }
    
    func setBee(){
        bee = SKSpriteNode(imageNamed: "bee")
        bee.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 75)
        bee.size = CGSizeMake(bee.size.width / 5 * 4, bee.size.height / 5 * 4)
        bee.zPosition = 3
        bee.size = CGSizeMake(bee.size.width / 1.5, bee.size.height / 1.5)
        self.addChild(bee)
    }
    
    func setItems() {
        setBeard()
        setHat()
        setDecor()
        setGlasses()
        setTie()
    }
    
    func setHat() {
        if let wearHat = NSUserDefaults.standardUserDefaults().valueForKey("hat") as? Int {
            if wearHat != -1 {
            hat = SKSpriteNode(imageNamed: "hat\(wearHat + 1)")
           
            
                switch wearHat {
                case 0:
                hat.size = CGSizeMake(105.991, 75.784)
                    hat.position = CGPointMake(-139.005, 60.801)
                case 1:
                    hat.size = CGSizeMake(92.327, 76.484)
                    hat.position = CGPointMake(-121.502, 65.128)
                case 2:
                    hat.size = CGSizeMake(125.475, 58.12)
                    hat.position = CGPointMake(-107.66, 56.15)
                case 3:
                    hat.size = CGSizeMake(107.185, 98.488)
                    hat.position = CGPointMake(-111.074, 77.941)
                case 4:
                    hat.size = CGSizeMake(166.295, 66.19)
                    hat.position = CGPointMake(-127.319, 56.009)
                default:
                    print("OOPS")
                }
                
                hat.zPosition = 4
                bee.addChild(hat)
            }
        }
    }
    
    func setBeard() {
        if let wearBeard = NSUserDefaults.standardUserDefaults().valueForKey("beard") as? Int {
            if wearBeard != -1 {
                beard = SKSpriteNode(imageNamed: "beard\(wearBeard + 1)")
            
                switch wearBeard {
                case 0:
                    beard.size = CGSizeMake(65.67, 29.895)
                    beard.position = CGPointMake(-121.691, -49.884)
                case 1:
                    beard.size = CGSizeMake(65.5, 63.799)
                    beard.position = CGPointMake(-128.319, -69.189)
                case 2:
                    beard.size = CGSizeMake(33.521, 55.211)
                    beard.position = CGPointMake(-119.319, -72.061)
                case 3:
                    beard.size = CGSizeMake(71.391, 53.415)
                    beard.position = CGPointMake(-121.812, -60.959) // mistake y
                case 4:
                    beard.size = CGSizeMake(50.516, 68.426)
                    beard.position = CGPointMake(-120.32, -75.456)
                default:
                    print("OOPS")
                }
            
                beard.zPosition = 5
                bee.addChild(beard)
            }
        }
    }
    
    func setDecor() {
        if let wearDecor = NSUserDefaults.standardUserDefaults().valueForKey("decor") as? Int {
            if wearDecor != -1 {
                decor = SKSpriteNode(imageNamed: "decor\(wearDecor + 1)")
                decor.size = CGSizeMake(103, 46)
                decor.position = CGPointMake(53, 56)
                
                decor.zPosition = 4
                bee.addChild(decor)
            }
        }
    }
    
    func setGlasses() {
        if let wearGlasses = NSUserDefaults.standardUserDefaults().valueForKey("glasses") as? Int {
            if wearGlasses != -1 {
                glasses = SKSpriteNode(imageNamed: "glasses\(wearGlasses + 1)")
        
            
                switch wearGlasses {
                case 0:
                    glasses.size = CGSizeMake(55.787, 38.622)
                    glasses.position = CGPointMake(-136.243, 39.715)
                case 1:
                    glasses.size = CGSizeMake(58.746, 35.459)
                    glasses.position = CGPointMake(-134.084, 39.644)
                case 2:
                    glasses.size = CGSizeMake(63.725, 39.898)
                    glasses.position = CGPointMake(-130.447, 39.695)
                case 3:
                    glasses.size = CGSizeMake(62.265, 39.325)
                    glasses.position = CGPointMake(-134.195, 39.577)
                case 4:
                    glasses.size = CGSizeMake(63.543, 40.487)
                    glasses.position = CGPointMake(-133.953, 39.447)
                default:
                    print("OOPS")
                }
                glasses.zPosition = 4
                bee.addChild(glasses)
            }
        }
    }
    
    func setTie() {
        if let wearTie = NSUserDefaults.standardUserDefaults().valueForKey("tie") as? Int {
            if wearTie != -1 {
                tie = SKSpriteNode(imageNamed: "tie\(wearTie + 1)")
           
                
                switch wearTie {
                case 0:
                    tie.size = CGSizeMake(23.764, 22.667)
                    tie.position = CGPointMake(-78.181, -44.149)
                case 1:
                    tie.size = CGSizeMake(22.713, 21.415)
                    tie.position = CGPointMake(-79.706, -39.951)
                case 2:
                    tie.size = CGSizeMake(48.016, 46.45)
                    tie.position = CGPointMake(-75.174, -59.468)
                case 3:
                    tie.size = CGSizeMake(12.581, 11.819)
                    tie.position = CGPointMake(-79.671, -41.153)
                case 4:
                    tie.size = CGSizeMake(35.933, 43.524)
                    tie.position = CGPointMake(-85.204, -57.391)
                default:
                    print("OOPS")
                }
            
                tie.zPosition = 4
                bee.addChild(tie)
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            if backBtn.containsPoint(location) {
                goToHomeScene()
            }
        }
    }
    
    func goToHomeScene() {
        let homeScene: HomeScene = HomeScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        homeScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(homeScene, transition: transition)
    }

}
