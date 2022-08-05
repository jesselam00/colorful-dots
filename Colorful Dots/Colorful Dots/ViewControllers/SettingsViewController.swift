//
//  SettingsViewController.swift
//  Colorful Dots
//
//  Created by Student Account  on 01/01/1401 AP.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var SettingsLabel: UILabel!
    @IBOutlet weak var AudioButton: UIButton!
    @IBOutlet weak var muteSFXButton: UIButton!
    
    var myString:NSString = "Settings"
    var myMutableString = NSMutableAttributedString()
    
    var circleLayer = CAShapeLayer();
    let randomColors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
    
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    
    @IBOutlet var SettingsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if SoundManager.instance.musicState == 0 {
            AudioButton.setTitle("Music Muted", for: .normal)
            AudioButton.setTitleColor(UIColor.red, for: .normal)
        }
        if (UserDefaults.standard.bool(forKey: "sfx")) {
            muteSFXButton.setTitle("Mute Sound", for: .normal)
            muteSFXButton.setTitleColor(UIColor.green, for: .normal)
        } else {
            muteSFXButton.setTitle("Sound Muted", for: .normal)
            muteSFXButton.setTitleColor(UIColor.red, for: .normal)
        }
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "AppleSDGothicNeo-Light", size: 36.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:1,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:2,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:3,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSRange(location:4,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:5,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: NSRange(location:6,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:7,length:1))
        
        SettingsLabel.attributedText = myMutableString
        
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
    
    @IBAction func AudioButton(_ sender: Any) {
        if (AudioButton.titleLabel?.text == "Mute Music"){
            UserDefaults.standard.set(false, forKey: "music")
            AudioButton.setTitle("Music Muted", for: .normal)
            SoundManager.instance.stopMusic()
            AudioButton.setTitleColor(UIColor.red, for: .normal)
        }
        else {
            UserDefaults.standard.set(true, forKey: "music")
            AudioButton.setTitle("Mute Music", for: .normal)
            SoundManager.instance.playMusic()
            AudioButton.setTitleColor(UIColor.green, for: .normal)
        }
        
        
    }
    
    
    @IBAction func SFXButton(_ sender: Any) {
        if (muteSFXButton.titleLabel?.text == "Mute Sound"){
            UserDefaults.standard.set(false, forKey: "sfx")
            muteSFXButton.setTitle("Sound Muted", for: .normal)
            muteSFXButton.setTitleColor(UIColor.red, for: .normal)
        }
        else {
            UserDefaults.standard.set(true, forKey: "sfx")
            muteSFXButton.setTitle("Mute Sound", for: .normal)
            let sounds = [SoundManager.soundOption.drop,SoundManager.soundOption.select,SoundManager.soundOption.bonk,SoundManager.soundOption.button,SoundManager.soundOption.reset,SoundManager.soundOption.oops]
            SoundManager.instance.playSound(sound: sounds.randomElement()!)
            muteSFXButton.setTitleColor(UIColor.green, for: .normal)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
