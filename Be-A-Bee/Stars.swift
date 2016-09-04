//
//  Stars.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 31/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class Stars: SKSpriteNode {
    
    static let ORIGINAL_WIDTH: CGFloat = 264
    static let ORIGINAL_HEIGHT: CGFloat = 255
    
    static let WIDTH: CGFloat = 1024
    static let HEIGHT: CGFloat = 768
    
    static let MAX_DIVIDE: CGFloat = 13
    
    private var timer: NSTimer!
    private var divideSize: CGFloat!
    
    
    convenience init(pos: CGPoint) {
        self.init(imageNamed: "Star")
        getRandomSize()
        self.position = CGPointMake(pos.x, pos.y)
        self.zPosition = 3
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(Stars.ChangeSize), userInfo: nil, repeats: false)
    }
    
    func getRandomSize() {
        let random = CGFloat(arc4random_uniform(3) + 5)
        divideSize = random
        self.size = CGSizeMake(self.size.width / random, self.size.height / random)
    }
    
    func ChangeSize() {
        if self.divideSize <= Stars.MAX_DIVIDE {
            divideSize = divideSize + 0.1
            self.size = CGSizeMake(Stars.ORIGINAL_WIDTH / self.divideSize, Stars.ORIGINAL_HEIGHT / self.divideSize)
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(Stars.ChangeSize), userInfo: nil, repeats: false)
        } else {
            if timer != nil {
                timer.invalidate()
            }
        }
    }
}
