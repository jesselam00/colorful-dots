//
//  CustomWinViewController.swift
//  Colorful Dots
//
//  Created by Noah Grubbs on 4/15/22.
//

import Foundation
import UIKit

class CustomWinViewController: UIViewController {
    // add vars to pass in here
    var parentView: GameViewController? = nil
    var n: Int = 0
    
    var timer = Timer()
    
    var circleLayer = CAShapeLayer();
    let randomColors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
    
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var HintLabel: UILabel!
    
    @IBOutlet var WinScreenView: UIView!
    @IBOutlet weak var StarOne: UIImageView!
    @IBOutlet weak var StarTwo: UIImageView!
    @IBOutlet weak var StarThree: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        StarOne.alpha = 0.3
        StarTwo.alpha = 0.3
        StarThree.alpha = 0.3
        if n == 5 {
            StarOne.alpha = 1.0
            StarTwo.alpha = 0.3
            StarThree.alpha = 0.3
        }
        else if n == 10 {
            StarOne.alpha = 1.0
            StarTwo.alpha = 1.0
            StarThree.alpha = 0.3
        }
        else {
            StarOne.alpha = 1.0
            StarTwo.alpha = 1.0
            StarThree.alpha = 1.0
        }
        
        HintLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        WinScreenView.alpha = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 0,  repeats: false, block: { _ in
            
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.WinScreenView.alpha = 1.0}, completion: nil)
            SoundManager.instance.playSound(sound: .win)
        })
        self.timer = Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.3...1.9),  repeats: true, block: { _ in
            
            self.createNewCircleLayer()
            self.runAnimations()
            
        })
        self.timer = Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.2...2.1),  repeats: true, block: { _ in
            
            self.createNewCircleLayer()
            self.runAnimations()
            
        })
        self.timer = Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.7...2.3),  repeats: true, block: { _ in
            
            self.createNewCircleLayer()
            self.runAnimations()
            
        })
        
    }
    
    func runAnimations() {
        self.animateAppear()
        self.animateDisappear()
        self.animateMovement()
        
    }

    
    func createNewCircleLayer() {
        circleLayer = CAShapeLayer()
        let randomX = Int.random(in: 0..<400)
        let randomY = Int.random(in: 50..<800)
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: randomX, y: randomY, width: 50, height: 50)).cgPath;
        circleLayer.fillColor = randomColors.randomElement();
        circleLayer.opacity = 0
        view.layer.addSublayer(circleLayer)
    }
    
    func animateAppear() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 0.2
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()+1
        circleLayer.add(animation, forKey: nil)
        
    }
    
    func animateDisappear() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.2
        animation.toValue = 0
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()+3
        circleLayer.add(animation, forKey: nil)
        
    }
    
    func animateMovement() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: circleLayer.frame.origin.x + (circleLayer.frame.size.width/2), y: circleLayer.frame.origin.y + (circleLayer.frame.size.height/2))
        animation.toValue = CGPoint(x:150, y:0)
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()+3
        circleLayer.add(animation, forKey: nil)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: {
            SoundManager.instance.playMusic()
            self.parentView?.returnToLevelSelect()
        })

    }
}
