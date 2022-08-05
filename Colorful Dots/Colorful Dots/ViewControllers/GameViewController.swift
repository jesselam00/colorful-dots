//
//  GameViewController.swift
//  Colorful Dots
//
//  Created by Noah Grubbs on 3/14/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var count: Int = 0
    var n: Int = 0
    var parentView: LevelSelectionViewController?
    var score: Int = 0
    
    var timer2 = Timer()
    var timer3 = Timer()
    var timer4 = Timer()

    @IBOutlet var GameView: SKView!
    @IBOutlet weak var CounterLabel: UILabel!
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewDidLoad()
        
        self.CounterLabel.textColor = SKColor.white
        self.CounterLabel.textAlignment = NSTextAlignment.center
        var timer = Timer.scheduledTimer(withTimeInterval:1.0, repeats: true) {_ in
            self.count = self.count + 1
            self.CounterLabel.text = "Time: \(self.count)"
        }
        buildScene()
    }
    
    // Builds the game scene
    func buildScene(){
        //print(n)
        GameView.alpha = 0
        self.timer4 = Timer.scheduledTimer(withTimeInterval: 0,  repeats: false, block: { _ in
            
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
                self.GameView.alpha = 1.0}, completion: nil)
        })
        self.count = 0
        self.CounterLabel.text = "Time: \(self.count)"
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.viewController = self
                scene.loadLevel(i: n)
                
                // Present the scene
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Handles returning to level select after the game is won
    func returnToLevelSelect(c: Int){
        self.timer2 = Timer.scheduledTimer(withTimeInterval: 0.5,  repeats: false, block: { _ in
            
            SoundManager.instance.playSound(sound: .win)
            
        })
    
        if count >= 60 {
            score = c * 500
        } else {
            score = c * (60-count) * 1000
        }
        SoundManager.instance.stopMusic()
        
        parentView!.updateDatatbase(score: score,id: n,time: Float(count))
        self.timer3 = Timer.scheduledTimer(withTimeInterval: 0.4,  repeats: false, block: { _ in
            if (self.n == 5 || self.n == 10 || self.n == 15) {
                self.createSpecialCustomAlert()
            } else {
                self.createCustomAlert()
            }
        })
    }
    
    // Resets the game scene
    @IBAction func ResetScene(_ sender: Any) {
        SoundManager.instance.playSound(sound: .reset)     // plays button audio
        buildScene()
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        returnToLevelSelect()
    }
    
    // Handles returning to level select
    func returnToLevelSelect(){
        SoundManager.instance.playSound(sound: .button)     // plays button audio
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController!.popToViewController(parentView!, animated: false)
    }
    
    // Creates the default alert for winning the level
    func createCustomAlert()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = sb.instantiateViewController(identifier: "WinScreenViewController") as! WinScreenViewController
        alertVC.parentView = self
        alertVC.score = score
        alertVC.time = count
        alertVC.modalPresentationStyle = .overCurrentContext
        self.present(alertVC, animated: false, completion: nil)
    }
    
    // Creates the special alert for winning the last level in the world
    func createSpecialCustomAlert()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = sb.instantiateViewController(identifier: "CustomWinViewController") as! CustomWinViewController
        alertVC.parentView = self
        alertVC.n = n
        // add vars to pass here
        alertVC.modalPresentationStyle = .overCurrentContext
        self.present(alertVC, animated: false, completion: nil)
    }
    
}
