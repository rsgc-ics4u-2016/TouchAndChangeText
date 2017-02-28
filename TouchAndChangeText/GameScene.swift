//
//  GameScene.swift
//  SimpleGame
//
//  Created by Russell Gordon on 11/27/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import SpriteKit

class GameScene : SKScene {
    
    // MARK: Properties
    let tileLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    
    // This function runs once at the start of the game
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.white
        
        // Show the score
        tileLabel.text = "1"
        tileLabel.fontColor = SKColor.black
        tileLabel.name = "tile"
        tileLabel.fontSize = 96
        tileLabel.zPosition = 150  // Make sure the label stays on top of everything else!
        tileLabel.position = CGPoint(x: size.width / 2, y: size.height / 2) // Top-right corner
        self.addChild(tileLabel)
        
    }
    
    
    
    // This allows the scene to respond to a touch
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
        // A touch actually has many points (since a finger is large) so
        // only proceed if we can get the first touch
        guard let touch = touches.first else {
            return
        }
        
        // Get the location of the first touch
        let touchLocation = touch.location(in: self)
        
        // Now find all the obstacles currently colliding with Santa
        if let tile = self.childNode(withName: "tile") as? SKLabelNode {
            
            // Check to see if the obstacle is intersecting with Santa
            if tile.frame.contains(touchLocation) {
                
                // This obstacle is currently a "hit", so add it to the list of items colliding with Santa
                if let text = tile.text {
                    if text == "1" {
                        tile.text = "0"
                    } else {
                        tile.text = "1"
                    }
                }
                
            }
        }
            
        
        
    }
    
}































