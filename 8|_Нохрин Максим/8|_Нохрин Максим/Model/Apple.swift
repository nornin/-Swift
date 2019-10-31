//
//  Apple.swift
//  8|_Нохрин Максим
//
//  Created by Maksim on 31/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import  UIKit
import SpriteKit

class Apple: SKShapeNode {
    convenience init(position: CGPoint) {
        self.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        
        fillColor = .red
        
        self.position = position
        
        physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        
        physicsBody?.categoryBitMask = ColliderCategories.Apple
    }
}
