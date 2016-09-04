//
//  GameManager.swift
//  Be-A-Bee
//
//  Created by Meitar Basson on 31/08/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import SpriteKit

class GameManager {
    static let sharedInstance = GameManager()
    
    // Colliders
    let COLLIDER_BEE: UInt32 = 1 << 0
    let COLLIDER_JAR_ROCK: UInt32 = 1 << 1 // For Rock and Jar
    
}
