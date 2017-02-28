//
//  GameScene.swift
//  SimpleGame
//
//  Created by Russell Gordon on 11/27/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import SpriteKit

class GameScene : SKScene {
    
    // This function runs once at the start of the game
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.white
        
        // Show three labels
        for x in stride(from: size.width/4, through: size.width/4*3, by: size.width/4) {
            
            let tileLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
            tileLabel.text = String(arc4random_uniform(2)) // 0 or 1, never 2
            tileLabel.fontColor = SKColor.black
            tileLabel.name = "tile"
            tileLabel.fontSize = 96
            tileLabel.zPosition = 150  // Make sure the label stays on top of everything else!
            tileLabel.position = CGPoint(x: x, y: size.height / 2) // Spaced across middle of scene
            self.addChild(tileLabel)
            
        }
        
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
        
        // Iterate over all child nodes in the scene
        for childNode in self.children {
            
            // Deal only with child nodes named "tile"
            if childNode.name == "tile" {
                
                // Try to obtain a reference to the node as an SKLabelNode
                if let tile = childNode as? SKLabelNode {
                    
                    // Check to see if the touch location was inside this tile's boundaries
                    if tile.frame.contains(touchLocation) {
                        
                        // Change the state of the tile
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
        
        
        
    }
    
}































