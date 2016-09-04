//
//  SellHoney.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 26/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit
import StoreKit

class SellHoney: SKScene, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    var background: SKSpriteNode!
    var title: SKSpriteNode!
    var backBtn: SKSpriteNode!
    
    var sell = [SKSpriteNode]()
    var options = [SKSpriteNode]()
    
    
    var honey: SKSpriteNode!
    var coin: SKSpriteNode!
    
    var honeyCount: SKLabelNode!
    var coinCount: SKLabelNode!
    
    
    var emptyNodeOne = SKSpriteNode()
    var emptyNodeTwo = SKSpriteNode()
    var alert: SCLAlertView!
    
    var y = -1
    
    //IAP
    var purchaseButton: SKLabelNode!
    
    private var request : SKProductsRequest!
    private var products : [SKProduct] = [] // List of available purchases
    
    
    override func didMoveToView(view: SKView) {
        setBack()
        setTitle()
        setBtns()
        setSell()
        setYouHave()
        
        
        setPurchaseBtn()
        // In-App Purchase
        initInAppPurchases()
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
    
    func setSell() {
        for x in 0...3 {
            sell.append(SKSpriteNode(imageNamed: "Sell"))
            sell[x].size = CGSizeMake(sell[x].size.width / 2, sell[x].size.height / 2)
            sell[x].position = CGPointMake(self.size.width - 370, title.position.y - 210 - 70 * CGFloat(x))
            sell[x].zPosition = 3
            self.addChild(sell[x])
        }
        
        for x in 0...3 {
            options.append(SKSpriteNode(imageNamed: "Buy\(x)"))
            options[x].size = CGSizeMake(options[x].size.width / 2, options[x].size.height / 2)
            options[x].position = CGPointMake(self.size.width / 2 - 80 , sell[x].position.y)
            options[x].zPosition = 4
            self.addChild(options[x])
        }
        
    }
    
    func setYouHave() {
        honey = SKSpriteNode(imageNamed: "Honey")
        honey.size = CGSizeMake(honey.size.width / 1.5, honey.size.height / 1.5)
        honey.position = CGPointMake(self.size.width / 2 - 50, title.position.y - 70)
        honey.zPosition = 5
        
        coin = SKSpriteNode(imageNamed: "Coin")
        coin.size = CGSizeMake(coin.size.width / 3, coin.size.height / 3)
        coin.position = CGPointMake(self.size.width / 2 - 50, title.position.y - 140)
        coin.zPosition = 5
        
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            if let coins = NSUserDefaults.standardUserDefaults().valueForKey("coins") as? Int {
                
                coinCount = SKLabelNode(text: "x \(coins)")
                honeyCount = SKLabelNode(text: "x \(jars)")
                
                coinCount.position = CGPointMake(20, 0)
                honeyCount.position = CGPointMake(20, 0)
                
                if coins > 1000 {
                    honeyCount.position = CGPointMake(40, 0)
                    coinCount.position = CGPointMake(40, 0)
                } else if coins > 10000 {
                    honeyCount.position = CGPointMake(60, 0)
                    coinCount.position = CGPointMake(60, 0)
                } else if coins > 100000 {
                    honeyCount.position = CGPointMake(80, 0)
                    coinCount.position = CGPointMake(80, 0)
                }
            } else {
                coinCount = SKLabelNode(text: "x 0")
                honeyCount = SKLabelNode(text: "x \(jars)")
                
                honeyCount.position = CGPointMake(20, 0)
                coinCount.position = CGPointMake(20, 0)
            }
            
            if jars > 1000 {
                honeyCount.position = CGPointMake(40, 0)
                coinCount.position = CGPointMake(40, 0)
            } else if jars > 10000 {
                honeyCount.position = CGPointMake(60, 0)
                coinCount.position = CGPointMake(60, 0)
            } else if jars > 100000 {
                honeyCount.position = CGPointMake(80, 0)
                coinCount.position = CGPointMake(80, 0)
            }
            
        } else {
            coinCount = SKLabelNode(text: "x 0")
            honeyCount = SKLabelNode(text: "x 0")
            
            honeyCount.position = CGPointMake(20, 0)
            coinCount.position = CGPointMake(20, 0)
        }
        
        
        emptyNodeOne.anchorPoint = CGPointMake(0, 0)
        emptyNodeTwo.anchorPoint = CGPointMake(0, 0)
        
        emptyNodeTwo.position = CGPointMake(coin.position.x + 35, coin.position.y - 10)
        emptyNodeOne.position = CGPointMake(honey.position.x + 35, honey.position.y - 10)
        
        coinCount.fontName = "HelveticaNeue-UltraLight-Bold"
        honeyCount.fontName = "HelveticaNeue-UltraLight-Bold"
        
        coinCount.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        honeyCount.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        
        emptyNodeTwo.addChild(coinCount)
        emptyNodeOne.addChild(honeyCount)
        
        coinCount.zPosition = 5
        honeyCount.zPosition = 5
        
        coinCount.fontSize = coinCount.fontSize - 4
        honeyCount.fontSize = honeyCount.fontSize - 4
        
        self.addChild(emptyNodeOne)
        self.addChild(emptyNodeTwo)
        
        self.addChild(coin)
        self.addChild(honey)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            if backBtn.containsPoint(location) {
                goToHomeScene()
            }
            
            if purchaseButton.containsPoint(location) {
                inAppPurchase()
            }
            
            for x in 0...3 {
                alert = SCLAlertView()
                if sell[x].containsPoint(location) {
                    y = x
                    switch x {
                    case 0:
                        alert.addButton("Exchange", target: self, selector: #selector(SellHoney.exchange))
                        alert.showSuccess("", subTitle: "Exchange 6 jars for 1 coin?")
                    case 1:
                        alert.addButton("Exchange", target: self, selector: #selector(SellHoney.exchange))
                        alert.showSuccess("", subTitle: "Exchange 50 jars for 10 coin?")
                    case 2:
                        alert.addButton("Exchange", target: self, selector: #selector(SellHoney.exchange))
                        alert.showSuccess("", subTitle: "Exchange 100 jars for 25 coin?")
                    case 3:
                        alert.addButton("Exchange", target: self, selector: #selector(SellHoney.exchange))
                        alert.showSuccess("", subTitle: "Exchange 1000 jars for 350 coin?")
                    default:
                        "Weird"
                    }
                }
            }
        }
    }
    
    func exchange() {
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            var coins = 0
            if let coinsAmount = NSUserDefaults.standardUserDefaults().valueForKey("coins") as? Int {
                coins = coinsAmount
            }
            switch y {
            case 0:
                if jars >= 6 {
                    NSUserDefaults.standardUserDefaults().setValue(jars - 6, forKey: "jars")
                    NSUserDefaults.standardUserDefaults().setValue(coins + 1, forKey: "coins")
                    refreshLabels()
                } else {
                   noJars()
                }
            case 1:
                if jars >= 50 {
                    NSUserDefaults.standardUserDefaults().setValue(jars - 50, forKey: "jars")
                    NSUserDefaults.standardUserDefaults().setValue(coins + 10, forKey: "coins")
                    refreshLabels()
                } else {
                   noJars()
                }
            case 2:
                if jars >= 100 {
                    NSUserDefaults.standardUserDefaults().setValue(jars - 100, forKey: "jars")
                    NSUserDefaults.standardUserDefaults().setValue(coins + 25, forKey: "coins")
                    refreshLabels()
                } else {
                   noJars()
                }
            case 3:
                if jars >= 1000 {
                    NSUserDefaults.standardUserDefaults().setValue(jars - 1000, forKey: "jars")
                    NSUserDefaults.standardUserDefaults().setValue(coins + 350, forKey: "coins")
                    refreshLabels()
                } else {
                   noJars()
                }
            default:
                print("Weird")
            }
        } else {
            noJars()
        }
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func refreshLabels() {
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int , let coins = NSUserDefaults.standardUserDefaults().valueForKey("coins") as? Int {
            coinCount.text = "x \(coins)"
            honeyCount.text = "x \(jars)"
        }
    }
    
    func noJars() {
        SCLAlertView().showError("Hold On...", subTitle:"You don't have enough jars!", closeButtonTitle:"OK")
    }
    
    func goToHomeScene() {
        let homeScene: HomeScene = HomeScene(size: self.size)
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 0.0)
        homeScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(homeScene, transition: transition)
    }
    
    
    func setPurchaseBtn() {
        purchaseButton = SKLabelNode()
        purchaseButton.position = CGPointMake(self.size.width / 2, backBtn.position.y + 50)
        purchaseButton.zPosition = 3
        purchaseButton.fontName = "HelveticaNeue-UltraLight-Bold"
        purchaseButton.text = "Add Jars"
        purchaseButton.fontSize = 20
        purchaseButton.fontColor = UIColor(red: 82 / 255, green: 82 / 255, blue: 82 / 255, alpha: 1)
        self.addChild(purchaseButton)
    }
    
    func inAppPurchase()
    {
        if products.count - 1 > 0 {
            
            let alert = UIAlertController(title: "In App Purchases", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                for x in 0...products.count - 1 {
                    let product = products[x]
                    if (product.productIdentifier == "jar1\(x)") {
                        let numberFormatter = NSNumberFormatter()
                        numberFormatter.numberStyle = .CurrencyStyle
                        numberFormatter.locale = product.priceLocale
                
                        alert.addAction(UIAlertAction(title: product.localizedTitle + " " + numberFormatter.stringFromNumber(product.price)!, style: UIAlertActionStyle.Default) { _ in
                        self.buyProduct(product)
                        })
                    }
            }
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { _ in
        })
        
        // Show the alert
                self.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func initInAppPurchases()
    {
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        
        // Get the list of possible purchases
        if self.request == nil {
            self.request = SKProductsRequest(productIdentifiers: Set(["jar10","jar11", "jar12", "jar13"]))
            self.request.delegate = self
            self.request.start()
        }
    }
    
    // Request a purchase
    func buyProduct(product: SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment)
    }
    
    // Restore purchases
    func restorePurchasedProducts() {
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
    
    // StoreKit protocoll method. Called when the AppStore responds
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        self.products = response.products
        self.request = nil
    }
    
    // StoreKit protocoll method. Called when an error happens in the communication with the AppStore
    func request(request: SKRequest, didFailWithError error: NSError) {
        print(error)
        self.request = nil
    }
    
    // StoreKit protocoll method. Called after the purchase
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch (transaction.transactionState) {
                
            case .Purchased:
                if transaction.payment.productIdentifier == "jar10" {
                    // buy 40 jars
                    buy40Jars()
                } else if transaction.payment.productIdentifier == "jar11" {
                    buy90Jars()
                } else if transaction.payment.productIdentifier == "jar12" {
                    buy600Jars()
                } else if transaction.payment.productIdentifier == "jar13" {
                    buy1000Jars()
                }
                queue.finishTransaction(transaction)
                
//            case .Restored:
//                if transaction.payment.productIdentifier == "" {
//                    buy90Jars()
//                    // Buy 90 jars
//                }
//                queue.finishTransaction(transaction)
                
            case .Failed:
                print("Payment Error: %@", transaction.error)
                queue.finishTransaction(transaction)
            default:
                print("Transaction State: %@", transaction.transactionState)
            }
        }
    }
    
    func buy40Jars() {
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            NSUserDefaults.standardUserDefaults().setValue(jars + 40, forKey: "jars")
            honeyCount.text = "x \(jars + 40)"
        }else {
            NSUserDefaults.standardUserDefaults().setValue(40, forKey: "jars")
        }
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func buy90Jars() {
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            NSUserDefaults.standardUserDefaults().setValue(jars + 90, forKey: "jars")
            honeyCount.text = "x \(jars + 90)"
        }else {
            NSUserDefaults.standardUserDefaults().setValue(90, forKey: "jars")
        }
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func buy600Jars() {
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            NSUserDefaults.standardUserDefaults().setValue(jars + 600, forKey: "jars")
            honeyCount.text = "x \(jars + 600)"
        }else {
            NSUserDefaults.standardUserDefaults().setValue(600, forKey: "jars")
        }
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func buy1000Jars() {
        if let jars = NSUserDefaults.standardUserDefaults().valueForKey("jars") as? Int {
            NSUserDefaults.standardUserDefaults().setValue(jars + 1000, forKey: "jars")
            honeyCount.text = "x \(jars + 1000)"
        }else {
            NSUserDefaults.standardUserDefaults().setValue(1000, forKey: "jars")
        }
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
}

