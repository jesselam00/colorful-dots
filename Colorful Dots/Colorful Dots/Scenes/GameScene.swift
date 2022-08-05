//
//  GameScene.swift
//  Colorful Dots
//
//  Created by Noah Grubbs on 3/14/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    var startPoint: CGPoint = CGPoint()
    var currentPoint: CGPoint = CGPoint()
    var yourline: SKShapeNode? = nil
    var currentLine = -1
    var pathToDraw = CGMutablePath()
    var startNode = SKShapeNode()
    var nodeList: [SKShapeNode] = []
    var tutorialList: [SKShapeNode] = []
    var traversed: [Int] = []
    var ind: Int = -1
    var order: [SKColor] = []
    var viewController: GameViewController?
    var firstNode: Int = 1
    var tutorialLine: SKShapeNode? = nil

        
    override func didMove(to view: SKView) {
        
    }
    
    //Loads the level based on the given level id
    func loadLevel(i: Int){
        tutorialList = []
        switch i {
        case 1:
            tutorialList.append(makeCirlceInPosition(location: CGPoint(x:-75, y:300), name: "tesT", color: SKColor.white, r: 20))
            tutorialList.append(makeCirlceInPosition(location: CGPoint(x:0, y:300), name: "test", color: SKColor.red, r: 20))
            tutorialList.append(makeCirlceInPosition(location: CGPoint(x:75, y:300), name: "tesT", color: SKColor.blue, r: 20))
            tutorialLine = SKShapeNode()
            pathToDraw = CGMutablePath()
            pathToDraw.move(to: CGPoint(x:-75, y:300))
            pathToDraw.addLine(to: CGPoint(x:75, y:300))
            tutorialLine?.path = pathToDraw
            tutorialLine?.strokeColor = SKColor.white
            tutorialLine?.lineWidth = 3
            tutorialLine?.zPosition = -10
            addChild((tutorialLine)!)
            buildCircles3X(colorList: [SKColor.white, SKColor.red, SKColor.blue, SKColor.blue, SKColor.red, SKColor.white, SKColor.white, SKColor.red, SKColor.blue])
            order = [nodeList[0].fillColor, nodeList[1].fillColor, nodeList[2].fillColor]
        case 2:
            buildCircles3X(colorList: [SKColor.red, SKColor.blue, SKColor.red, SKColor.white, SKColor.blue, SKColor.white, SKColor.blue, SKColor.red, SKColor.white])
            order = [nodeList[3].fillColor, nodeList[0].fillColor, nodeList[1].fillColor]
        case 3:
            buildCircles3X(colorList: [SKColor.white, SKColor.red, SKColor.blue, SKColor.white, SKColor.red, SKColor.white, SKColor.blue, SKColor.red, SKColor.blue])
            order = [nodeList[0].fillColor, nodeList[1].fillColor, nodeList[2].fillColor]
        case 4:
            buildCircles3X(colorList: [SKColor.blue, SKColor.white, SKColor.blue, SKColor.red, SKColor.blue, SKColor.red, SKColor.white, SKColor.red, SKColor.white])
            order = [nodeList[1].fillColor, nodeList[3].fillColor, nodeList[0].fillColor]
        case 5:
            makeCirlceInPosition(location: CGPoint(x:-90, y:350), name: "tesT", color: SKColor.white, r: 20)
            makeCirlceInPosition(location: CGPoint(x:-30, y:350), name: "test", color: SKColor.red, r: 20)
            makeCirlceInPosition(location: CGPoint(x:30, y:350), name: "tesT", color: SKColor.blue, r: 20)
            makeCirlceInPosition(location: CGPoint(x:90, y:350), name: "tesT", color: SKColor.yellow, r: 20)
            tutorialLine = SKShapeNode()
            pathToDraw = CGMutablePath()
            pathToDraw.move(to: CGPoint(x:-90, y:350))
            pathToDraw.addLine(to: CGPoint(x:90, y:350))
            tutorialLine?.path = pathToDraw
            tutorialLine?.strokeColor = SKColor.white
            tutorialLine?.lineWidth = 3
            tutorialLine?.zPosition = -10
            addChild((tutorialLine)!)
            
            buildCircles4X(colorList: [SKColor.white, SKColor.blue, SKColor.yellow, SKColor.blue, SKColor.yellow, SKColor.red, SKColor.red, SKColor.white, SKColor.blue, SKColor.white, SKColor.white, SKColor.red, SKColor.yellow, SKColor.red, SKColor.blue, SKColor.yellow])
            order = [nodeList[0].fillColor, nodeList[5].fillColor, nodeList[1].fillColor, nodeList[2].fillColor]
        case 6:
            buildCircles3X(colorList: [SKColor.red, SKColor.blue, SKColor.blue, SKColor.white, SKColor.white, SKColor.red, SKColor.red, SKColor.blue, SKColor.white])
            order = [nodeList[3].fillColor, nodeList[0].fillColor, nodeList[1].fillColor]
        case 7:
            buildCircles3X(colorList: [SKColor.white, SKColor.white, SKColor.blue, SKColor.blue, SKColor.red, SKColor.red, SKColor.red, SKColor.white, SKColor.blue])
            order = [nodeList[0].fillColor, nodeList[4].fillColor, nodeList[2].fillColor]
        case 8:
            buildCircles3X(colorList: [SKColor.white, SKColor.blue, SKColor.blue, SKColor.white, SKColor.red, SKColor.red, SKColor.red, SKColor.blue, SKColor.white])
            order = [nodeList[0].fillColor, nodeList[4].fillColor, nodeList[1].fillColor]
        case 9:
            buildCircles3X(colorList: [SKColor.blue, SKColor.white, SKColor.blue, SKColor.red, SKColor.white, SKColor.red, SKColor.white, SKColor.red, SKColor.blue])
            order = [nodeList[1].fillColor, nodeList[3].fillColor, nodeList[0].fillColor]
        case 10:
            buildCircles4X(colorList: [SKColor.red, SKColor.yellow, SKColor.yellow, SKColor.blue, SKColor.blue, SKColor.white, SKColor.white, SKColor.red, SKColor.red, SKColor.yellow, SKColor.red, SKColor.white, SKColor.white, SKColor.blue, SKColor.yellow, SKColor.blue])
            order = [nodeList[5].fillColor, nodeList[0].fillColor, nodeList[3].fillColor, nodeList[1].fillColor]
        case 11:
            buildCircles4X(colorList: [SKColor.white, SKColor.red, SKColor.blue, SKColor.white, SKColor.yellow, SKColor.blue, SKColor.red, SKColor.yellow, SKColor.red, SKColor.blue, SKColor.blue, SKColor.white, SKColor.yellow, SKColor.white, SKColor.red, SKColor.yellow])
            order = [nodeList[0].fillColor, nodeList[1].fillColor, nodeList[2].fillColor, nodeList[4].fillColor]
        case 12:
            buildCircles4X(colorList: [SKColor.red, SKColor.blue, SKColor.white, SKColor.red, SKColor.yellow, SKColor.white, SKColor.yellow, SKColor.blue, SKColor.white, SKColor.blue, SKColor.red, SKColor.yellow, SKColor.red, SKColor.blue, SKColor.yellow, SKColor.white])
            order = [nodeList[2].fillColor, nodeList[0].fillColor, nodeList[1].fillColor, nodeList[4].fillColor]
        case 13:
            buildCircles4X(colorList: [SKColor.white, SKColor.red, SKColor.white, SKColor.blue, SKColor.blue, SKColor.yellow, SKColor.yellow, SKColor.red, SKColor.blue, SKColor.yellow, SKColor.yellow, SKColor.white, SKColor.red, SKColor.white, SKColor.red, SKColor.blue])
            order = [nodeList[0].fillColor, nodeList[1].fillColor, nodeList[3].fillColor, nodeList[5].fillColor]
        case 14:
            buildCircles4X(colorList: [SKColor.blue, SKColor.red, SKColor.white, SKColor.yellow, SKColor.white, SKColor.yellow, SKColor.blue, SKColor.white, SKColor.white, SKColor.red, SKColor.yellow, SKColor.red, SKColor.red, SKColor.blue, SKColor.blue, SKColor.yellow])
            order = [nodeList[2].fillColor, nodeList[1].fillColor, nodeList[0].fillColor, nodeList[3].fillColor]
        case 15:
            makeCirlceInPosition(location: CGPoint(x:-120, y:350), name: "tesT", color: SKColor.white, r: 20)
            makeCirlceInPosition(location: CGPoint(x:-60, y:350), name: "test", color: SKColor.red, r: 20)
            makeCirlceInPosition(location: CGPoint(x:0, y:350), name: "tesT", color: SKColor.blue, r: 20)
            makeCirlceInPosition(location: CGPoint(x:60, y:350), name: "tesT", color: SKColor.yellow, r: 20)
            makeCirlceInPosition(location: CGPoint(x:120, y:350), name: "tesT", color: SKColor.green, r: 20)
            tutorialLine = SKShapeNode()
            pathToDraw = CGMutablePath()
            pathToDraw.move(to: CGPoint(x:-120, y:350))
            pathToDraw.addLine(to: CGPoint(x:120, y:350))
            tutorialLine?.path = pathToDraw
            tutorialLine?.strokeColor = SKColor.white
            tutorialLine?.lineWidth = 3
            tutorialLine?.zPosition = -10
            addChild((tutorialLine)!)
            buildCircles5X(colorList: [SKColor.white, SKColor.red, SKColor.blue, SKColor.red, SKColor.blue, SKColor.white, SKColor.red, SKColor.white, SKColor.yellow, SKColor.yellow, SKColor.green, SKColor.yellow, SKColor.blue, SKColor.green, SKColor.green, SKColor.blue, SKColor.green, SKColor.blue, SKColor.yellow, SKColor.white, SKColor.red, SKColor.white, SKColor.yellow, SKColor.red, SKColor.green])
            order = [nodeList[0].fillColor, nodeList[1].fillColor, nodeList[2].fillColor, nodeList[8].fillColor, nodeList[10].fillColor]
        default:
            print("I'm dead reeeeee")
        }
        
    }
    
    // Builds the indivdual level from colorList of size 3x3
    func buildCircles3X(colorList: [SKColor]){
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:100), name: "0",color: colorList[0]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:100), name: "0",color: colorList[1]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:100), name: "0",color: colorList[2]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:0), name: "0",color: colorList[3]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:0), name: "0",color: colorList[4]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:0), name: "0",color: colorList[5]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:-100), name: "0",color: colorList[6]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:-100), name: "0",color: colorList[7]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:-100), name: "0",color: colorList[8]))
        for i in 1...9{
            traversed.append(0)
        }
    }
    
    // Builds the indivdual level from colorList of size 4x4
    func buildCircles4X(colorList: [SKColor]){
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-150, y:150), name: "0",color: colorList[0]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-50, y:150), name: "0",color: colorList[1]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:50, y:150), name: "0",color: colorList[2]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:150, y:150), name: "0",color: colorList[3]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-150, y:50), name: "0",color: colorList[4]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-50, y:50), name: "0",color: colorList[5]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:50, y:50), name: "0",color: colorList[6]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:150, y:50), name: "0",color: colorList[7]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-150, y:-50), name: "0",color: colorList[8]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-50, y:-50), name: "0",color: colorList[9]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:50, y:-50), name: "0",color: colorList[10]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:150, y:-50), name: "0",color: colorList[11]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-150, y:-150), name: "0",color: colorList[12]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-50, y:-150), name: "0",color: colorList[13]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:50, y:-150), name: "0",color: colorList[14]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:150, y:-150), name: "0",color: colorList[15]))
        for i in 1...16{
            traversed.append(0)
        }
    }
    
    // Builds the indivdual level from colorList of size 5x5
    func buildCircles5X(colorList: [SKColor]){
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-200, y:200), name: "0",color: colorList[0]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:200), name: "0",color: colorList[1]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:200), name: "0",color: colorList[2]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:200), name: "0",color: colorList[3]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:200, y:200), name: "0",color: colorList[4]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-200, y:100), name: "0",color: colorList[5]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:100), name: "0",color: colorList[6]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:100), name: "0",color: colorList[7]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:100), name: "0",color: colorList[8]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:200, y:100), name: "0",color: colorList[9]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-200, y:0), name: "0",color: colorList[10]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:0), name: "0",color: colorList[11]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:0), name: "0",color: colorList[12]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:0), name: "0",color: colorList[13]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:200, y:0), name: "0",color: colorList[14]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-200, y:-100), name: "0",color: colorList[15]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:-100), name: "0",color: colorList[16]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:-100), name: "0",color: colorList[17]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:-100), name: "0",color: colorList[18]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:200, y:-100), name: "0",color: colorList[19]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-200, y:-200), name: "0",color: colorList[20]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:-100, y:-200), name: "0",color: colorList[21]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:0, y:-200), name: "0",color: colorList[22]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:100, y:-200), name: "0",color: colorList[23]))
        nodeList.append(makeCirlceInPosition(location: CGPoint(x:200, y:-200), name: "0",color: colorList[24]))
        for i in 1...25{
            traversed.append(0)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    // User releases touch
    func touchUp(atPoint pos : CGPoint) {
        let touchedNode = self.nodes(at: (pos))
        var failed = true
        for nod in touchedNode {
            // If there are any named nodes in colision with users touch
            if let name = nod.name {
                // If there are a game circle
                if name == "0" {
                    var newInd = nodeList.firstIndex(of: nod as! SKShapeNode)!
                    // If the connection isn't longer than 150 pixels, and if the touched circle does not have a connection and is the next color in the ordering
                    if sqrt(pow(nod.position.x - startPoint.x, 2) + pow(nod.position.y - startPoint.y, 2)) < 150 {
                        if newInd != ind && checkTouched(ind: newInd) && checkOrder(colA: nodeList[ind], colB: nodeList[newInd]) && yourline != nil{
                            // Then draw the new corrected line, set the Travesed for both the circles, and play the drop sound
                            yourline?.removeFromParent()
                            yourline = SKShapeNode()
                            pathToDraw = CGMutablePath()
                            pathToDraw.move(to: nod.position)
                            pathToDraw.addLine(to: startPoint)
                            yourline?.path = pathToDraw
                            yourline?.strokeColor = SKColor.white
                            yourline?.lineWidth = 5
                            yourline?.zPosition = -10
                            addChild((yourline)!)
                            firstNode = 0
                            setTraversed(ind: ind, n: 2)
                            setTraversed(ind: newInd, n: 1)
                            checkWin()
                            failed = false
                            yourline = nil
                            currentLine-=1
                            
                            SoundManager.instance.playSound(sound: .drop)
                        }
                    }
                }
            }
            
        }
        // If a connection was not made for any reason delete the line and reset the first circles traversed
        if failed == true && yourline != nil && ind > -1{
            SoundManager.instance.playSound(sound: .oops)
            failed = false
            yourline?.removeFromParent()
            currentLine-=1
            if firstNode == 1 {
                setTraversed(ind: ind, n: 0)
            } else {
                setTraversed(ind: ind, n: 1)
            }
            ind = -1
            yourline = nil
        }
        
    }
    
    // Set the traversed of the given circle to the given int
    func setTraversed(ind: Int, n: Int){
        traversed[ind] = n
    }
    
    // Check if all the circles have been traversed and ends the game if they have
    func checkWin(){
        var c=0
        for bol in traversed{
            if bol>=1{
                c+=1
            }
        }
        if c == traversed.count {
            
            self.viewController?.returnToLevelSelect(c: traversed.count-1)
        }
    }
    
    // Gets the traversed value for the given circle
    func checkTraversed(ind: Int) -> Bool{
        
        return traversed[ind]<2
    }
    // Returns a bool value based on wether the given circle has been touched or not
    func checkTouched(ind: Int) -> Bool{
        return traversed[ind]==0
    }
    
    // given the color of two circles checks if the second one follows the first in the order for the level and returns a bool
    func checkOrder(colA: SKShapeNode, colB: SKShapeNode)-> Bool{
        let ind = order.firstIndex(of: colA.fillColor)!
        let ind2 = order.firstIndex(of: colB.fillColor)!
        if ind + 1 >= order.count{
                if ind2 == 0{
                    return true
                } else {
                    return false
                }
        } else if ind + 1 == ind2 {
            return true
        }else {
            return false
        }
        
    }
    
    // When the user begins a touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
                
                let positionInScene = t.location(in: self)
                let touchedNode = self.atPoint(positionInScene)
                // If the user is touching a circle within the game
                if let name = touchedNode.name {
                    if name == "0" {
                        ind = nodeList.firstIndex(of: touchedNode as! SKShapeNode)!
                        // If the touched circle is the first in the correct order and it is the first circle touched or the touched circle has an in connection but not an out connection
                        if (checkTraversed(ind: ind) && firstNode > 0 && nodeList[ind].fillColor == order[0]) || (traversed[ind] >= 1 && checkTraversed(ind: ind))
                        {
                            // Select the circle and set up for drawing the line
                            SoundManager.instance.playSound(sound: .select)
                            
                            currentLine+=1
                            yourline = SKShapeNode()
                            setTraversed(ind: ind, n: 1)
                            startPoint = touchedNode.position
                        }
                    }
                }
            }
    }
    
    // If the user moves there touch
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
                // If there is a line that is being drawn
                if yourline != nil {
                    // Checks if the line is longer than the maximum allowed length
                    if (sqrt(pow(t.location(in: self).x - startPoint.x, 2) + pow(t.location(in: self).y - startPoint.y, 2)) > 200){
                        // If it is longer then remove the line, play the oops sounds, and set the travesed of the first circle selected
                        SoundManager.instance.playSound(sound: .oops)
                        yourline?.removeFromParent()
                        currentLine-=1
                        if firstNode == 1 {
                            setTraversed(ind: ind, n: 0)
                        } else {
                            setTraversed(ind: ind, n: 1)
                        }
                        ind = -1
                        yourline = nil
                    } else {
                        // If the line is not too long then update the line to the position of the users touch
                        yourline?.removeFromParent()
                        
                        currentPoint = t.location(in: self)
                        yourline? = SKShapeNode()
                        pathToDraw = CGMutablePath()
                        pathToDraw.move(to: currentPoint)
                        pathToDraw.addLine(to: startPoint)
                        yourline?.path = pathToDraw
                        yourline?.strokeColor = SKColor.white
                        yourline?.lineWidth = 5
                        yourline?.zPosition = 0
                        addChild(yourline!)
                    }
                }
            }
        }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    // Buils a circle at the given position of the given color with the optional argument for the size of the circle
    func makeCirlceInPosition(location: CGPoint, name: String, color: SKColor, r: Int = 35) -> SKShapeNode{
            
        let Circle = SKShapeNode(circleOfRadius: CGFloat(r) ) // Size of Circle = Radius setting.
        Circle.position = location  //touch location passed from touchesBegan.
        Circle.name = name
        Circle.strokeColor = color
        Circle.glowWidth = 1.0
        Circle.fillColor = color
        self.addChild(Circle)
            
            return Circle
        }
}
