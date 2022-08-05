//
//  WinScreenViewController.swift
//  Colorful Dots
//
//  Created by Noah Grubbs on 4/13/22.
//

import Foundation
import UIKit

class WinScreenViewController: UIViewController {
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var circleLayer = CAShapeLayer();
    let randomColors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
    
    var time: Int = 0
    var score: Int = 0
    var parentView: GameViewController? = nil
    
    var timer = Timer()
    
    @IBOutlet weak var CompetedLabel: UILabel!
    var myString:NSString = "Level Completed!"
    var myMutableString = NSMutableAttributedString()
    
    @IBOutlet var WinScreenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
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
    
    func setup(){
        timeLabel.text = "Time: \(time)"
        scoreLabel.text = "Score: \(score)"
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "AppleSDGothicNeo-Light", size: 42.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:1,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:2,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:3,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:4,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:5,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:6,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:7,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:8,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:9,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:10,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: NSRange(location:11,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:12,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:13,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:14,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:15,length:1))
        
        CompetedLabel.attributedText = myMutableString
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: {
            SoundManager.instance.playMusic()
            self.parentView?.returnToLevelSelect()
        })
    }
    
    @IBAction func continueButton(_ sender: Any) {
        self.dismiss(animated: false, completion: {
            SoundManager.instance.playMusic()
            self.parentView?.n = self.parentView!.n + 1
            self.parentView?.buildScene()
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
    
}
