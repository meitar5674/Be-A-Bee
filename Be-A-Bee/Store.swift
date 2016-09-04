//
//  Store.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 26/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit


class Store: SKScene {
    
    var background: SKSpriteNode!
    var title: SKSpriteNode!
    var backBtn: SKSpriteNode!
    
    var categoriesArr = [SKSpriteNode]()
    var itemsArr = [SKSpriteNode]()
    
    var buyArr = [SKSpriteNode]()
    var tryWearArr = [SKSpriteNode]()
  //  var wearArr = [SKSpriteNode]()
    
    var bee: SKSpriteNode!
    
    var category = 1
    
    var hat: SKSpriteNode!
    var decor: SKSpriteNode!
    var beard: SKSpriteNode!
    var tie: SKSpriteNode!
    var glasses: SKSpriteNode!
    
    var clothesOffBtn: SKSpriteNode!
    
    var itemNum = 0
    var prices: SKSpriteNode!
    
    
    var jarAmount: SKSpriteNode!
    var coinAmount: SKSpriteNode!
    
    var jarLabel: SKLabelNode!
    var coinLabel: SKLabelNode!
    
    var alert: SCLAlertView!
    
    override func didMoveToView(view: SKView) {
        setBack()
        setTitle()
        setCategories()
        setItems()
        setPrices()
        setBtns()
        setBee()
        setWearableItems()
        setBeeClothes()
        setAmounts()
        changeToBought()
        checkWearOrTry()
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
    
    func setCategories() {
        for x in 0...4 {
            categoriesArr.append(SKSpriteNode(imageNamed: "category\(x)"))
            categoriesArr[x].size = CGSizeMake(categoriesArr[x].size.width / 4 * 3, categoriesArr[x].size.height / 4 * 3)
            categoriesArr[x].position = CGPointMake(self.size.width / 2 - 150 + CGFloat(x) * categoriesArr[x].size.width , title.position.y - 100)
            categoriesArr[x].zPosition = 3
            self.addChild(categoriesArr[x])
        }
    }
    
    func setItems() {
        for x in 0...4 {
            itemsArr.append(SKSpriteNode(imageNamed: "beard\(x + 1)"))
            itemsArr[x].size = CGSizeMake(67, 30.5)
            itemsArr[x].position = CGPointMake(self.size.width / 2 - 150 + CGFloat(x) * categoriesArr[x].size.width, categoriesArr[x].position.y - 70)
            itemsArr[x].zPosition = 3
            self.addChild(itemsArr[x])
        }
    }
    
    func setPrices() {
        prices = SKSpriteNode(imageNamed: "prices")
        prices.size = CGSizeMake(prices.size.width / 8 * 3, prices.size.height / 8 * 3)
        prices.position = CGPointMake(self.size.width / 2, itemsArr[0].position.y - 45)
        prices.zPosition = 3
        self.addChild(prices)
    }
    
    func setBtns() {
        backBtn = SKSpriteNode(imageNamed: "Home")
        backBtn.size = CGSizeMake(491 / 4, 130 / 4)
        backBtn.position = CGPointMake(self.size.width / 2, 50)
        backBtn.zPosition = 2
        self.addChild(backBtn)
        setBuyArr()
        clothesOffBtn = SKSpriteNode(imageNamed: "Reset")
        clothesOffBtn.position = CGPointMake(tryWearArr[2].position.x, prices.position.y - 115)
        clothesOffBtn.zPosition = 3
        self.addChild(clothesOffBtn)
    }
    
    func setBuyArr() {
        for x in 0...4 {
            buyArr.append(SKSpriteNode(imageNamed: "Buy"))
            tryWearArr.append(SKSpriteNode(imageNamed: "Try"))
          //  wearArr.append(SKSpriteNode(imageNamed: "Wear"))
            
            buyArr[x].position = CGPointMake(itemsArr[x].position.x, prices.position.y - 45)
            tryWearArr[x].position = CGPointMake(itemsArr[x].position.x, prices.position.y - 80)
           // wearArr[x].position = CGPointMake(itemsArr[x].position.x, prices.position.y - 115)
            
            buyArr[x].zPosition = 3
            tryWearArr[x].zPosition = 3
        //    wearArr[x].zPosition = 3
            
            self.addChild(buyArr[x])
            self.addChild(tryWearArr[x])
           // self.addChild(wearArr[x])
        }
        
    }
    
    func setBee() {
        bee = SKSpriteNode(imageNamed: "bee")
        bee.size = CGSizeMake(bee.size.width * 0.3, bee.size.height * 0.3)
        bee.position = CGPointMake(self.size.width / 2, clothesOffBtn.position.y - 80)
        bee.zPosition = 3
        self.addChild(bee)
    }
    
    func setWearableItems() {
        hat = SKSpriteNode(imageNamed: "hat2")
        hat.zPosition = 5
        bee.addChild(hat)
        
        decor = SKSpriteNode(imageNamed: "decor1")
        decor.size = CGSizeMake(68.629, 30.574)
        decor.position = CGPointMake(31.797, 34.303)
        decor.zPosition = 5
        bee.addChild(decor)
        
        beard = SKSpriteNode(imageNamed: "beard1")
        beard.zPosition = 5
        bee.addChild(beard)
        
        glasses = SKSpriteNode(imageNamed: "glasses1")
        glasses.zPosition = 6
        bee.addChild(glasses)
        
        tie = SKSpriteNode(imageNamed: "tie1")
        tie.zPosition = 5
        bee.addChild(tie)
        
        tie.hidden = true
        glasses.hidden = true
        beard.hidden = true
        hat.hidden = true
        decor.hidden = true
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            if backBtn.containsPoint(location) {
                goToHomeScene()
            }
            
            if clothesOffBtn.containsPoint(location) {
                takeClothesOff()
            }
            
            
            if categoriesArr[0].containsPoint(location) {
                for x in 0...4 {
                    itemsArr[x].size = CGSizeMake(67, 30.5)
                    itemsArr[x].texture = SKTexture(imageNamed: "beard\(x + 1)")
                    category = 1
                }
                changeToBought()
                checkWearOrTry()
            } else if categoriesArr[1].containsPoint(location) {
                for x in 0...4 {
                    itemsArr[x].size = CGSizeMake(80, 48)
                    itemsArr[x].texture = SKTexture(imageNamed: "hat\(x + 1)")
                    category = 2
                }
                changeToBought()
                checkWearOrTry()
            }  else if categoriesArr[2].containsPoint(location) {
                for x in 0...4 {
                    itemsArr[x].size = CGSizeMake(50, 30)
                    itemsArr[x].texture = SKTexture(imageNamed: "decor\(x + 1)")
                    category = 3
                }
                changeToBought()
                checkWearOrTry()
            } else if categoriesArr[3].containsPoint(location) {
                for x in 0...4 {
                    itemsArr[x].size = CGSizeMake(80, 30)
                    itemsArr[x].texture = SKTexture(imageNamed: "glasses\(x + 1)")
                    category = 4
                }
                changeToBought()
                checkWearOrTry()
            } else if categoriesArr[4].containsPoint(location) {
                for x in 0...4 {
                    itemsArr[x].size = CGSizeMake(36, 24)
                    itemsArr[x].texture = SKTexture(imageNamed: "tie\(x + 1)")
                    category = 5
                }
                changeToBought()
                checkWearOrTry()
            }
            
            for x in 0...4 {
                if buyArr[x].containsPoint(location) {
                    itemNum = 0
                    alert = SCLAlertView()
                    
                    // Looking to buy show alert!
                    if buyArr[x].name  == "Buy" {
                        switch x {
                        case 0:
                            alert.addButton("Buy", target: self, selector: #selector(Store.Buy))
                            alert.showSuccess("", subTitle: "Buy this item for 20 coins?")
                            itemNum = 1
                        case 1:
                            alert.addButton("Buy", target: self, selector: #selector(Store.Buy))
                            alert.showSuccess("", subTitle: "Buy this item for 50 coins?")
                            itemNum = 2
                        case 2:
                            alert.addButton("Buy", target: self, selector: #selector(Store.Buy))
                            alert.showSuccess("", subTitle: "Buy this item for 100 coins?")
                            itemNum = 3
                        case 3:
                            alert.addButton("Buy", target: self, selector: #selector(Store.Buy))
                            alert.showSuccess("", subTitle: "Buy this item for 200 coins?")
                            itemNum = 4
                        case 4:
                            alert.addButton("Buy", target: self, selector: #selector(Store.Buy))
                            alert.showSuccess("", subTitle: "Buy this item for 500 coins?")
                            itemNum = 5
                        default:
                            "Weird"
                        }
                    } else {
                        alreadyBoughtFunc()
                    }
                }
                
                else if tryWearArr[x].containsPoint(location) {
                    //try it
                    if category == 1 {
                        if tryWearArr[x].name == "Try" {
                            tryBeard(x)
                        } else if tryWearArr[x].name == "Wear" {
                            wearBeard(x)
                        }
                    } else if category == 2 {
                        if tryWearArr[x].name == "Try" {
                            tryHat(x)
                        } else if tryWearArr[x].name == "Wear" {
                            wearHat(x)
                        }
                    } else if category == 3 {
                        if tryWearArr[x].name == "Try" {
                            tryDecor(x)
                        } else if tryWearArr[x].name == "Wear" {
                            wearDecor(x)
                        }
                    } else if category == 4 {
                        if tryWearArr[x].name == "Try" {
                            tryGlasses(x)
                        } else if tryWearArr[x].name == "Wear" {
                            wearGlasses(x)
                        }
                    } else if category == 5 {
                        if tryWearArr[x].name == "Try" {
                            tryTie(x)
                        } else if tryWearArr[x].name == "Wear" {
                            wearTie(x)
                        }
                    }
                }
                
                
//                else if wearArr[x].containsPoint(location) {
//                    //if already bought 
//                    if category == 1 {
//                        if let beard = NSUserDefaults.standardUserDefaults().valueForKey("beard\(x + 1)") as? Bool {
//                            if beard {
//                                wearBeard(x)
//                            }
//                        } else {
//                            didntBuy()
//                        }
//                    } else if category == 2 {
//                        if let hat = NSUserDefaults.standardUserDefaults().valueForKey("hat\(x + 1)") as? Bool {
//                            if hat {
//                              wearHat(x)
//                            }
//                        } else {
//                            didntBuy()
//                        }
//                    } else if category == 3 {
//                        if let decor = NSUserDefaults.standardUserDefaults().valueForKey("decor\(x + 1)") as? Bool {
//                            if decor {
//                                wearDecor(x)
//                            }
//                        } else {
//                            didntBuy()
//                        }
//                    } else if category == 4 {
//                        if let glasses = NSUserDefaults.standardUserDefaults().valueForKey("glasses\(x + 1)") as? Bool {
//                            if glasses {
//                                wearGlasses(x)
//                            }
//                        } else {
//                            didntBuy()
//                        }
//                    } else if category == 5 {
//                        if let tie =  NSUserDefaults.standardUserDefaults().valueForKey("tie\(x + 1)") as? Bool {
//                            if tie {
//                                wearTie(x)
//                            }
//                        } else {
//                            didntBuy()
//                        }
//                    }
//                }
                
                
            }
        }
    }
    
    func wearBeard(x: Int) {
        tryBeard(x)
        print(x)
        NSUserDefaults.standardUserDefaults().setValue(x, forKey: "beard") // x is which 1 he is wearing, 0 ~ 4
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func wearHat(x: Int) {
        tryHat(x)
        NSUserDefaults.standardUserDefaults().setValue(x, forKey: "hat")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func wearTie(x: Int) {
        tryTie(x)
        NSUserDefaults.standardUserDefaults().setValue(x, forKey: "tie") // x is which 1 he is wearing, 0 ~ 4
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func wearGlasses(x: Int) {
        tryGlasses(x)
        NSUserDefaults.standardUserDefaults().setValue(x, forKey: "glasses")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func wearDecor(x: Int) {
        tryDecor(x)
        NSUserDefaults.standardUserDefaults().setValue(x, forKey: "decor") // x is which 1 he is wearing, 0 ~ 4
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func tryBeard(x: Int) {
        beard.hidden = false
        beard.texture = SKTexture(imageNamed: "beard\(x + 1)")
        switch x {
        case 0:
            beard.size = CGSizeMake(37.732, 17.177)
            beard.position = CGPointMake(-68.735, -28.275)
        case 1:
            beard.size = CGSizeMake(18.284, 17.809)
            beard.position = CGPointMake(-71.607, -32.796)
        case 2:
            beard.size = CGSizeMake(9.675, 15.936)
            beard.position = CGPointMake(-67.477, -33.856)
        case 3:
            beard.size = CGSizeMake(40.345, 30.186)
            beard.position = CGPointMake(-69.001, -34.607)
        case 4:
            beard.size = CGSizeMake(43.861, 59.412)
            beard.position = CGPointMake(-68.392, -49.594)
        default:
            print("Weird")
        }
    }
    
    func tryHat(x: Int) {
        hat.hidden = false
        hat.texture = SKTexture(imageNamed: "hat\(x + 1)")
        switch x {
        case 0:
            hat.size = CGSizeMake(60.563, 43.304)
            hat.position = CGPointMake(-78.974, 34.231)
        case 1:
            hat.size = CGSizeMake(51.314, 36.69)
            hat.position = CGPointMake(-68.695, 35.35)
        case 2:
            hat.size = CGSizeMake(70.552, 32.68)
            hat.position = CGPointMake(-61.073, 32.043)
        case 3:
            hat.size = CGSizeMake(60.972, 51.474)
            hat.position = CGPointMake(-62.812, 44.346)
        case 4:
            hat.size = CGSizeMake(90.017, 35.829)
            hat.position = CGPointMake(-72.37, 31.786)
        default:
            print("Weird")
        }
    }
    
    func tryDecor(x: Int) {
        decor.hidden = false
        decor.texture = SKTexture(imageNamed: "decor\(x + 1)")
    }
    
    func tryGlasses(x: Int) {
        glasses.hidden = false
        glasses.texture = SKTexture(imageNamed: "glasses\(x + 1)")
        switch x {
        case 0:
            glasses.size = CGSizeMake(31.458, 21.779)
            glasses.position = CGPointMake(-76.595, 22.016)
        case 1:
            glasses.size = CGSizeMake(34.109, 23.615)
            glasses.position = CGPointMake(-75.69, 22.933)
        case 2:
            glasses.size = CGSizeMake(35.209, 22.044)
            glasses.position = CGPointMake(-74.719, 22.125)
        case 3:
            glasses.size = CGSizeMake(34.15, 21.631)
            glasses.position = CGPointMake(-76.199, 21.941)
        case 4:
            glasses.size = CGSizeMake(35.016, 22.311)
            glasses.position = CGPointMake(-75.815, 21.945)
        default:
            print("Weird")
        }
    }
    
    func tryTie(x: Int) {
        tie.hidden = false
        tie.texture = SKTexture(imageNamed: "tie\(x + 1)")
        switch x {
        case 0:
            tie.size = CGSizeMake(13.734, 13.1)
            tie.position = CGPointMake(-42.595, -24.348)
        case 1:
            tie.size = CGSizeMake(10.551, 9.948)
            tie.position = CGPointMake(-45.18, -22.914)
        case 2:
            tie.size = CGSizeMake(25.861, 25.018)
            tie.position = CGPointMake(-42.314, -33.191)
        case 3:
            tie.size = CGSizeMake(6.91, 6.491)
            tie.position = CGPointMake(-45.007, -23.134)
        case 4:
            tie.size = CGSizeMake(19.581, 23.718)
            tie.position = CGPointMake(-44.172, -30.747)
        default:
            print("Weird")
        }
        
    }
    
    func Buy() {
        var hasEnoughMoney = false
        var coinsAmount = 0
        if let coins = NSUserDefaults.standardUserDefaults().valueForKey("coins") as? Int {
            if coinsAmount < coins {
                coinsAmount = coins 
            }
           
        }
        print(coinsAmount)
        switch itemNum {
        case 1:
            if coinsAmount > 20 {
                hasEnoughMoney = true
                coinsAmount -= 20
            }
        case 2:
            if coinsAmount > 50 {
                hasEnoughMoney = true
                coinsAmount -= 50
            }
        case 3:
            if coinsAmount > 100 {
                hasEnoughMoney = true
                coinsAmount -= 100
            }
        case 4:
            if coinsAmount > 200 {
                hasEnoughMoney = true
                coinsAmount -= 200
            }
        case 5 :
            if coinsAmount > 500 {
                hasEnoughMoney = true
                coinsAmount -= 500
            }
        default:
            print("Weird")
        }
        print(coinsAmount)
        
        switch category {
        case 1:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("beard\(itemNum)") as? Bool {
                if alreadyBought {
                    // Already bought
                   alreadyBoughtFunc()
                }
            } else {
                if hasEnoughMoney {
                    // Buying
                    NSUserDefaults.standardUserDefaults().setValue(true, forKey: "beard\(itemNum)")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    successPurchase(coinsAmount)
                    changeToBought()
                    checkWearOrTry()
                } else {
                    // no money
                    noMoney()
                    
                }
            }
        case 2:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("hat\(itemNum)") as? Bool {
                if alreadyBought {
                    alreadyBoughtFunc()
                    // Already bought
                }
            } else {
                if hasEnoughMoney {
                    // Buying
                    NSUserDefaults.standardUserDefaults().setValue(true, forKey: "hat\(itemNum)")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    successPurchase(coinsAmount)
                    changeToBought()
                    checkWearOrTry()
                } else {
                    // no money
                    noMoney()
                }
            }
        case 3:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("decor\(itemNum)") as? Bool {
                if alreadyBought {
                    // Already bought
                    alreadyBoughtFunc()
                }
            } else {
                if hasEnoughMoney {
                    // Buying
                    NSUserDefaults.standardUserDefaults().setValue(true, forKey: "decor\(itemNum)")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    successPurchase(coinsAmount)
                    changeToBought()
                    checkWearOrTry()
                } else {
                    // no money
                    noMoney()
                }
            }
        case 4:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("glasses\(itemNum)") as? Bool {
                if alreadyBought {
                    // Already bought
                    alreadyBoughtFunc()
                }
            } else {
                if hasEnoughMoney {
                    // Buying
                    NSUserDefaults.standardUserDefaults().setValue(true, forKey: "glasses\(itemNum)")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    successPurchase(coinsAmount)
                    changeToBought()
                    checkWearOrTry()
                } else {
                    // no money
                    noMoney()
                }
            }
        case 5:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("tie\(itemNum)") as? Bool {
                if alreadyBought {
                    // Already bought
                    alreadyBoughtFunc()
                }
            } else {
                if hasEnoughMoney {
                    // Buying
                    NSUserDefaults.standardUserDefaults().setValue(true, forKey: "tie\(itemNum)")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    successPurchase(coinsAmount)
                    changeToBought()
                    checkWearOrTry()
                } else {
                    // no money
                    noMoney()
                }
            }
        default:
            print("Weird")
        }
       
        
    }
    
    func setBeeClothes() {
        if let beard2 = NSUserDefaults.standardUserDefaults().valueForKey("beard") as? Int {
            switch beard2 {
            case 0:
                tryBeard(0)
            case 1:
                tryBeard(1)
            case 2:
                tryBeard(2)
            case 3:
                tryBeard(3)
            case 4:
                tryBeard(4)
            default:
                print("No beard")
            }
        }
        
        if let hat2 = NSUserDefaults.standardUserDefaults().valueForKey("hat") as? Int {
            switch hat2 {
            case 0:
                tryHat(0)
            case 1:
                tryHat(1)
            case 2:
                tryHat(2)
            case 3:
                tryHat(3)
            case 4:
                tryHat(4)
            default:
                print("No hat")
            }
        }
        
        if let decor2 = NSUserDefaults.standardUserDefaults().valueForKey("decor") as? Int {
            switch decor2 {
            case 0:
                tryDecor(0)
            case 1:
                tryDecor(1)
            case 2:
                tryDecor(2)
            case 3:
                tryDecor(3)
            case 4:
                tryDecor(4)
            default:
                print("No decor")
            }
        }
        
        if let glasses2 = NSUserDefaults.standardUserDefaults().valueForKey("glasses") as? Int {
            switch glasses2 {
            case 0:
                tryGlasses(0)
            case 1:
                tryGlasses(1)
            case 2:
                tryGlasses(2)
            case 3:
                tryGlasses(3)
            case 4:
                tryGlasses(4)
            default:
                print("No glasses")
            }
        }
        
        if let tie2 = NSUserDefaults.standardUserDefaults().valueForKey("tie") as? Int {
            switch tie2 {
            case 0:
                tryTie(0)
            case 1:
                tryTie(1)
            case 2:
                tryTie(2)
            case 3:
                tryTie(3)
            case 4:
                tryTie(4)
            default:
                print("No tie")
            }
        }
    }
    
    func setAmounts() {
        coinAmount = SKSpriteNode(imageNamed: "Coin")
        coinAmount.position = CGPointMake(bee.position.x - 190 , bee.position.y)
        coinAmount.zPosition = 3
        coinAmount.size = CGSizeMake(coinAmount.size.width / 8 * 3, coinAmount.size.height / 8 * 3)
        self.addChild(coinAmount)
        
        jarAmount = SKSpriteNode(imageNamed: "Honey")
        jarAmount.position = CGPointMake(bee.position.x + 130 , bee.position.y)
        jarAmount.zPosition = 3
        jarAmount.size = CGSizeMake(jarAmount.size.width / 4 * 3, jarAmount.size.height / 4 * 3)
        self.addChild(jarAmount)
        
        if let coins = NSUserDefaults.standardUserDefaults().valueForKey("coins") as? Int {
            coinLabel = SKLabelNode(text: "x \(coins)")
            coinLabel.fontSize = 18
            if coins > 100 {
                coinLabel.fontSize = 14
            }
            if coins > 10000 {
                coinLabel.fontSize = 10
            }
        } else {
            coinLabel = SKLabelNode(text: "x 0")
            coinLabel.fontSize = 18
        }
        
        coinLabel.position = CGPointMake(bee.position.x - 140 , bee.position.y - 7)
        
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            jarLabel = SKLabelNode(text: "x \(jars)")
            jarLabel.fontSize = 18
            if jars > 100 {
                jarLabel.fontSize = 14
            }
            if jars > 10000 {
                jarLabel.fontSize = 10
            }
        } else {
            jarLabel = SKLabelNode(text: "x 0")
            jarLabel.fontSize = 18
        }
        
        if jarLabel.fontSize < coinLabel.fontSize {
            coinLabel.fontSize = jarLabel.fontSize
        }
        
        if coinLabel.fontSize < jarLabel.fontSize {
            jarLabel.fontSize = coinLabel.fontSize
        }
        
        jarLabel.position = CGPointMake(bee.position.x + 175    , bee.position.y - 7)
        
        jarLabel.zPosition = 3
        coinLabel.zPosition = 3
        
        coinLabel.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        jarLabel.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        
        jarLabel.fontName = "HelveticaNeue-UltraLight-Bold"
        coinLabel.fontName = "HelveticaNeue-UltraLight-Bold"
        
        self.addChild(jarLabel)
        self.addChild(coinLabel)
        
    }
    
    func checkWearOrTry() {
        for x in 0...4 {
            if buyArr[x].name == "Bought" {
                tryWearArr[x].texture = SKTexture(imageNamed: "Wear")
                tryWearArr[x].name = "Wear"
            } else if buyArr[x].name == "Buy" {
                tryWearArr[x].texture = SKTexture(imageNamed: "Try")
                tryWearArr[x].name = "Try"
            }
        }
    }
    
    func changeToBought() {
        for x in 0...4 {
        switch category {
        case 1:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("beard\(x + 1)") as? Bool {
                if alreadyBought {
                    print("oink")
                    buyArr[x].name = "Bought"
                    buyArr[x].texture = SKTexture(imageNamed: "Bought")
                }
            } else {
                    buyArr[x].name = "Buy"
                    buyArr[x].texture = SKTexture(imageNamed: "Buy")
            }
        case 2:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("hat\(x + 1)") as? Bool {
                if alreadyBought {
                    buyArr[x].name = "Bought"
                    buyArr[x].texture = SKTexture(imageNamed: "Bought")
                }
            } else {
                buyArr[x].name = "Buy"
                buyArr[x].texture = SKTexture(imageNamed: "Buy")
            }
        case 3:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("decor\(x + 1)") as? Bool {
                if alreadyBought {
                    buyArr[x].name = "Bought"
                    buyArr[x].texture = SKTexture(imageNamed: "Bought")
                }
            } else {
                buyArr[x].name = "Buy"
                buyArr[x].texture = SKTexture(imageNamed: "Buy")
            }
        case 4:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("glasses\(x + 1)") as? Bool {
                if alreadyBought {
                    buyArr[x].name = "Bought"
                    buyArr[x].texture = SKTexture(imageNamed: "Bought")
                }
            } else {
                buyArr[x].name = "Buy"
                buyArr[x].texture = SKTexture(imageNamed: "Buy")
            }
        case 5:
            if let alreadyBought = NSUserDefaults.standardUserDefaults().valueForKey("tie\(x + 1)") as? Bool {
                if alreadyBought {
                    buyArr[x].name = "Bought"
                    buyArr[x].texture = SKTexture(imageNamed: "Bought")
                }
            } else {
                buyArr[x].name = "Buy"
                buyArr[x].texture = SKTexture(imageNamed: "Buy")
            }
        default:
            print("Weird")
        }
        }

    }
    
    func alreadyBoughtFunc() {
        SCLAlertView().showInfo("Hold on...", subTitle: "You already bought this item")
    }
    
    func successPurchase(coinsAmount: Int){
        NSUserDefaults.standardUserDefaults().setValue(coinsAmount, forKey: "coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        SCLAlertView().showInfo("Thank you!", subTitle: "Item purchased successfully")
    }
    
    
    func noMoney() {
        SCLAlertView().showError("Hold On...", subTitle:"You don't have enough coins!", closeButtonTitle:"OK")
    }
    
    func didntBuy() {
        SCLAlertView().showError("Hold On...", subTitle:"You don't own this item yet", closeButtonTitle:"OK")
    }
    
    func takeClothesOff() {
        hat.hidden = true
        beard.hidden = true
        tie.hidden = true
        decor.hidden = true
        glasses.hidden = true
        NSUserDefaults.standardUserDefaults().setValue(-1, forKey: "hat")
        NSUserDefaults.standardUserDefaults().setValue(-1, forKey: "beard")
        NSUserDefaults.standardUserDefaults().setValue(-1, forKey: "tie")
        NSUserDefaults.standardUserDefaults().setValue(-1, forKey: "decor")
        NSUserDefaults.standardUserDefaults().setValue(-1, forKey: "glasses")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func goToHomeScene() {
        let homeScene: HomeScene = HomeScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        homeScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(homeScene, transition: transition)
    }
}

