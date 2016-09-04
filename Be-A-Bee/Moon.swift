//
//  Moon.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 30/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class Moon: SKSpriteNode {
    
    static let ORIGINAL_WIDTH: CGFloat = 922
    static let ORIGINAL_HEIGHT: CGFloat = 919
    
    static let WIDTH: CGFloat = 1024
    static let HEIGHT: CGFloat = 768
    
    static let MAX_DIVIDE: CGFloat = 10
    
    private var divideSize: CGFloat = 6
    private var timer: NSTimer!
    
    
    
    convenience init() {
        self.init(imageNamed: "Moon")
        self.size = CGSizeMake(self.size.width / self.divideSize, self.size.height / self.divideSize)
        self.position = CGPointMake(Moon.WIDTH - 340, Moon.HEIGHT - 100)
        self.zPosition = 3
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(Moon.ChangeSize), userInfo: nil, repeats: false)

    }
    
    func ChangeSize() {
        if divideSize <= Moon.MAX_DIVIDE {
            divideSize += 0.1
            self.size = CGSizeMake(Moon.ORIGINAL_WIDTH / self.divideSize, Moon.ORIGINAL_HEIGHT / self.divideSize)
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(Moon.ChangeSize), userInfo: nil, repeats: false)
        } else {
            if timer != nil {
                timer.invalidate()
            }
        }
    }
}
