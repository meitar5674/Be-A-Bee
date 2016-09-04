//
//  GameScene.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 25/08/2016.
//  Copyright (c) 2016 meitar. All rights reserved.
//

import SpriteKit

class HomeScene: SKScene {
    
    var bee: SKSpriteNode!
    var earnHoney: SKSpriteNode!
    var store: SKSpriteNode!
    var info: SKSpriteNode!
    var beeInfo: SKSpriteNode!
    var amounts: SKSpriteNode!
    var middle: SKSpriteNode!
    var sellHoney: SKSpriteNode!
    var background: SKSpriteNode!
    var title: SKSpriteNode!
    
    var tie: SKSpriteNode!
    
    var jar: SKSpriteNode!
    var coin: SKSpriteNode!
    var jarLabel: SKLabelNode!
    var coinLabel: SKLabelNode!
    var emptyNodeOne = SKSpriteNode()
    var emptyNodeTwo = SKSpriteNode()
    
    var rateBtn: SKSpriteNode!
    var moreByBtn: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        setHive()
        setBee()
        setTie()
        setBack()
        setTitle()
        setEmptyOne()
        setBtns()
        
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
        title.size = CGSizeMake(title.size.width * 0.95, title.size.height * 0.95)
        title.zPosition = 2
        self.addChild(title)
    }
    
    func setTie() {
        tie = SKSpriteNode(imageNamed: "tie1")
        tie.size = CGSizeMake(8.25 / 2, 7.75 / 2)
        tie.position = CGPointMake(bee.position.x - 18.833, bee.position.y - 10)
        tie.zPosition = 5
        self.addChild(tie)
    }
    
    func setBee() {
        bee = SKSpriteNode(imageNamed: "smallBee")
        bee.size = CGSizeMake(172.25 / 2, 89.5 / 2 )
        bee.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 30)
        bee.zPosition = 4
        self.addChild(bee)
    }
    
    
    func setHive() {
        middle = SKSpriteNode(imageNamed: "Empty")
        store = SKSpriteNode(imageNamed: "Store")
        info = SKSpriteNode(imageNamed: "Info")
        beeInfo = SKSpriteNode(imageNamed: "BeesInfo")
        amounts = SKSpriteNode(imageNamed: "Empty")
        earnHoney = SKSpriteNode(imageNamed: "EarnHoney")
        sellHoney = SKSpriteNode(imageNamed: "SellHoney")
        
        middle.size = CGSizeMake(111.15, 129)
        store.size = middle.size
        info.size = middle.size
        beeInfo.size = middle.size
        amounts.size = middle.size
        earnHoney.size = middle.size
        sellHoney.size = middle.size
        
        
        middle.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 30)
        store.position = CGPointMake(self.size.width / 2 + middle.size.width, self.size.height / 2 - 30)
        amounts.position = CGPointMake(self.size.width / 2 + middle.size.width / 2, self.size.height / 2 - middle.size.height * 3 / 4 - 30.5)
        earnHoney.position =  CGPointMake(self.size.width / 2 + middle.size.width / 2, self.size.height / 2 + middle.size.height * 3 / 4 - 29.5)
        info.position = CGPointMake(self.size.width / 2 - middle.size.width / 2, self.size.height / 2 - middle.size.height * 3 / 4 - 30.5)
        beeInfo.position = CGPointMake(self.size.width / 2 - middle.size.width, self.size.height / 2 - 30)
        sellHoney.position = CGPointMake(self.size.width / 2 - middle.size.width / 2 , self.size.height / 2 + middle.size.height * 3 / 4 - 29.5)
        
        middle.zPosition = 3
        store.zPosition = 3
        amounts.zPosition = 3
        earnHoney.zPosition = 3
        sellHoney.zPosition = 3
        beeInfo.zPosition = 3
        info.zPosition = 3
        
        self.addChild(middle)
        self.addChild(store)
        self.addChild(amounts)
        self.addChild(earnHoney)
        self.addChild(sellHoney)
        self.addChild(beeInfo)
        self.addChild(info)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            if info.containsPoint(location) {
                goToInfoScene()
            } else if beeInfo.containsPoint(location) {
                goToBeesInfoScene()
            } else if store.containsPoint(location) {
                goToStore()
            } else if sellHoney.containsPoint(location) {
                goToSellHoney()
            } else if middle.containsPoint(location) {
                goToBeeHomeScene()
            } else if earnHoney.containsPoint(location) {
                goToEarnHoney()
            } else if moreByBtn.containsPoint(location) {
                moreByPressed()
            } else if rateBtn.containsPoint(location) {
                rateBtnPressed()
            }
        }
    }
    
    func setEmptyOne() {
        jar = SKSpriteNode(imageNamed: "Honey")
        coin = SKSpriteNode(imageNamed: "Coin")
    
        jar.zPosition = 9
        coin.zPosition = 9
        
        jar.position = CGPointMake( -25, 15)
        coin.position = CGPointMake( -25, -20)
        
        var jarsCount = 0
        var coinsCount = 0
        
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars"){
            if let coins = NSUserDefaults.standardUserDefaults().valueForKey("coins") {
                jarLabel = SKLabelNode(text: "x \(jars)")
                coinLabel = SKLabelNode(text: "x \(coins)")
                
                jarsCount = jars as! Int
                coinsCount = coins as! Int
            } else {
                jarLabel = SKLabelNode(text: "x \(jars)")
                coinLabel = SKLabelNode(text: "x 0")
                
                jarsCount = jars as! Int
            }
        } else if let coins = NSUserDefaults.standardUserDefaults().valueForKey("coins") as? Int {
            jarLabel = SKLabelNode(text: "x 0")
            coinLabel = SKLabelNode(text: "x \(coins)")
            
            coinsCount = coins
        } else {
            jarLabel = SKLabelNode(text: "x 0")
            coinLabel = SKLabelNode(text: "x 0")
        }
        
        emptyNodeOne = SKSpriteNode()
        emptyNodeTwo = SKSpriteNode()
        emptyNodeOne.anchorPoint = CGPointMake(0, 0)
        emptyNodeTwo.anchorPoint = CGPointMake(0, 0)
        
        
        jarLabel.position = CGPointMake(6, 0)
        coinLabel.position = CGPointMake(8, 0)
        
        emptyNodeOne.position = CGPointMake(10, jar.position.y - 7)
        emptyNodeTwo.position = CGPointMake(10, coin.position.y - 7)
        
        if jarsCount >= 100 {
            jarLabel.fontSize = 22
        }
        
        if coinsCount >= 100 {
            coinLabel.fontSize = 22
        }
        
        if coinsCount >= 1000 {
            coinLabel.fontSize = 18
        }
        
        if jarsCount >= 1000 {
            jarLabel.fontSize = 18
        }
        
        if coinsCount >= 10000 {
            coinLabel.fontSize = 14
        }
        
        if jarsCount >= 10000 {
            jarLabel.fontSize = 14
        }
        
        if coinsCount < 100 {
            coinLabel.fontSize = 26
        }
        
        if jarsCount < 100 {
            jarLabel.fontSize = 26
        }
        
        if jarsCount > coinsCount {
            coinLabel.fontSize = jarLabel.fontSize
        } else {
            jarLabel.fontSize = coinLabel.fontSize
        }
        
        jarLabel.zPosition = 9
        coinLabel.zPosition = 9
        
        jarLabel.fontName = "HelveticaNeue-UltraLight-Bold"
        coinLabel.fontName = "HelveticaNeue-UltraLight-Bold"
        
        
        jar.size = CGSizeMake(jar.size.width / 2, jar.size.height / 2)
        coin.size = CGSizeMake(coin.size.width / 4, coin.size.height / 4)
        
        coinLabel.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        jarLabel.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        
        
        emptyNodeOne.addChild(jarLabel)
        emptyNodeTwo.addChild(coinLabel)
        
        amounts.addChild(emptyNodeTwo)
        amounts.addChild(emptyNodeOne)
        amounts.addChild(jar)
        amounts.addChild(coin)
        
    }
    func goToInfoScene() {
        let infoScene: InfoScene = InfoScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        infoScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(infoScene, transition: transition)
    }
    
    func goToBeesInfoScene() {
        let beesInfoScene: BeesInfoScene = BeesInfoScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        beesInfoScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(beesInfoScene, transition: transition)
    }
    
    func goToStore() {
        let store: Store = Store(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        store.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(store, transition: transition)
    }
    
    func goToSellHoney() {
        let sellHoney: SellHoney = SellHoney(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        sellHoney.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(sellHoney, transition: transition)
    }
    
    func goToEarnHoney() {
        let earnHoney: BeeGameScene = BeeGameScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        earnHoney.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(earnHoney, transition: transition)
    }
    
    func goToBeeHomeScene() {
        let beeHomeScene: BeeHomeScene = BeeHomeScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        beeHomeScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(beeHomeScene, transition: transition)
    }
    
    func setBtns() {
        rateBtn = SKSpriteNode(imageNamed: "Rate")
        rateBtn.position = CGPointMake(self.size.width / 2, 70)
        rateBtn.zPosition = 3
        self.addChild(rateBtn)
        
        moreByBtn = SKSpriteNode(imageNamed: "More")
        moreByBtn.position = CGPointMake(self.size.width / 2, 120)
        moreByBtn.zPosition = 3
        self.addChild(moreByBtn)
        
    }
    
    
    func rateBtnPressed() {
        
        //Change APP ID
        //Change APP ID        
        //Change APP ID
        //Change APP ID
        //Change APP ID
        UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/app/id1150808173")!)
    }
    
    func moreByPressed() {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/us/developer/meitar-basson/id1129766345")!)
    }
}
