//
//  BeesInfoScene.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 26/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit


class BeesInfoScene: SKScene {
    
    var background: SKSpriteNode!
    var title: SKSpriteNode!
    var backBtn: SKSpriteNode!
    
    var facts: SKSpriteNode!
    
    
    override func didMoveToView(view: SKView) {
        setBack()
        setTitle()
        setBtns()
        setFacts()
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
    
    func setFacts() {
        facts = SKSpriteNode(imageNamed: "Facts")
        facts.position = CGPointMake(self.size.width / 2, self.size.height / 2  - 80)
        facts.zPosition = 3
        facts.size = CGSizeMake(facts.size.width / 2.1, facts.size.height / 1.7)
        self.addChild(facts)
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
