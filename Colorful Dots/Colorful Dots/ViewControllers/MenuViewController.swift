//
//  MenuViewController.swift
//  Colorful Dots
//
//  Created by Student Account  on 01/01/1401 AP.
//

import Foundation
import UIKit
import CoreData

class MenuViewController: UIViewController {

    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var PlayButton: UIButton!
    @IBOutlet var SettingsButton: UIButton!
    @IBOutlet var RestartButton: UIButton!
    
    var myString:NSString = "Colorful Dots"
    var myMutableString = NSMutableAttributedString()
    
    var circleLayer = CAShapeLayer();
    let randomColors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
    
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SoundManager.instance.playMusic()
        
        // Do any additional setup after loading the view.
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "AppleSDGothicNeo-Light", size: 54.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:1,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:2,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:3,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSRange(location:4,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:5,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: NSRange(location:6,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:7,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:9,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:10,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:11,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSRange(location:12,length:1))
        TitleLabel.attributedText = myMutableString
        
        loadData()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.3...1.9),  repeats: true, block: { _ in
            
            self.createNewCircleLayer()
            self.runAnimations()
            
        })
        self.timer = Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.2...2.1),  repeats: true, block: { _ in
            
            self.createNewCircleLayer()
            self.runAnimations()
            
        })
        self.timer = Timer.scheduledTimer(withTimeInterval: Double.random(in: 0.7...1.5),  repeats: true, block: { _ in
            
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
        animation.toValue = 0.5
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()+1
        circleLayer.add(animation, forKey: nil)
        
    }
    
    func animateDisappear() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.5
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
    
    @IBAction func RestartButton(_ sender: Any) {
        SoundManager.instance.playSound(sound: .button)
        let alert = UIAlertController(title: "Restart", message: "Are you sure you want to start all of your progress?", preferredStyle: .alert)

        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {_ in
            SoundManager.instance.playSound(sound: .bonk)
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            set[0].score = 0
            set[0].unlocked = true
            set[0].time = 0
            for i in 1...14{
                set[i].score = 0
                set[i].unlocked = false
                set[i].time = 0
            }
            do {
                try context.save()
            } catch {
                print("error updating level")
                
            }
            
            })
        yesAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(yesAction)
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: {_ in
            //SoundManager.instance.playSound(sound: .button)
        })
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    @IBAction func SettingsButton(_ sender: Any) {
        SoundManager.instance.playSound(sound: .button)
    }
    @IBAction func PlayButton(_ sender: Any) {
        SoundManager.instance.playSound(sound: .button)
    }
    
    func loadData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if (UserDefaults.standard.bool(forKey: "isDownloaded")) {
            print("data already downloaded")
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameLevel")
            do {
                let newSet = try context.fetch(fetchRequest) as! [GameLevel]
                set = newSet
            } catch {
                print(error)
            }
        }
        else {
            print("fetching data")
            var newSet: [GameLevel] = []
            UserDefaults.standard.set(true, forKey: "isDownloaded")
            for item in GameLevelSet.getHardCodedCollection() {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let newItem = NSEntityDescription.insertNewObject(forEntityName: "GameLevel", into: context) as!GameLevel
                newItem.id = Int16(item.id)
                newItem.score = 0
                newSet.append(newItem)
                set = newSet
            }
            do {
                try context.save()
            }
            catch{
                print(error)
            }
            
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
