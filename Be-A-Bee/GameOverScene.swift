//
//  GameOverScene.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 01/09/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var lastCountJars: SKLabelNode!
    
    var back: SKSpriteNode!
    var title: SKSpriteNode!
    var backBtn: SKSpriteNode!
    var gameOver: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        setBack()
        setTitle()
        setBtns()
        setLabel()
        setGameOver()
    }
    
    func setBack() {
        back = SKSpriteNode(imageNamed: "beeGameBack")
        back.size = CGSizeMake(1050, 1050)
        back.position = CGPointMake(self.size.width / 2 , self.size.height / 2)
        back.zPosition = 1
        self.addChild(back)
    }
    
    func setTitle() {
        title = SKSpriteNode(imageNamed: "title")
        title.position = CGPointMake(self.size.width / 2, self.size.height - 100)
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
    
    func setLabel() {
        if let last = NSUserDefaults.standardUserDefaults().valueForKey("lastCountJars") as? Int {
            
            if last == 0 {
                lastCountJars = SKLabelNode(text: "No Jars Collected!")
            }
            
            if last == 1 {
                lastCountJars = SKLabelNode(text: "You Collected A Single Jar!")

            }
            
            if last > 1 {
                 lastCountJars = SKLabelNode(text: "You Collected \(last) Jars!")
            }
           
        }
        
        lastCountJars.position = CGPointMake(self.size.width / 2 , self.size.height - 200)
        lastCountJars.zPosition = 3
        self.addChild(lastCountJars)
    }
    
    func setGameOver() {
        gameOver = SKSpriteNode(imageNamed: "Game Over")
        gameOver.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 70)
        gameOver.size = CGSizeMake(gameOver.size.width / 4 * 3, gameOver.size.height / 4 * 3)
        gameOver.zPosition = 3
        self.addChild(gameOver)
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
