//
//  LevelSelectionViewController.swift
//  Colorful Dots
//
//  Created by Student Account  on 01/01/1401 AP.
//

import Foundation
import UIKit
import CoreData

class LevelSelectionViewController: UIViewController {
    
    //var set: [GameLevel] = []
    var worldState = 1
    var levels: [Int] = []

    var n: Int = 1

    
    var circleLayer = CAShapeLayer();
    var circleLayer2 = CAShapeLayer();
    
    let randomColors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
    
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    
    var imageView1 = UIImageView();
    var imageView2 = UIImageView();
    var imageView3 = UIImageView();
    var imageView4 = UIImageView();
    var imageView5 = UIImageView();
    var imageView6 = UIImageView();
    var imageView7 = UIImageView();
    var imageView8 = UIImageView();
    var imageView9 = UIImageView();
    var imageView10 = UIImageView();


    @IBOutlet weak var WorldLabel: UILabel!
    
    var myString:NSString = "World 1"
    var myMutableString = NSMutableAttributedString()
    
    @IBOutlet weak var LevelOne: UIButton!
    @IBOutlet weak var LevelTwo: UIButton!
    @IBOutlet weak var LevelThree: UIButton!
    @IBOutlet weak var LevelFour: UIButton!
    @IBOutlet weak var LevelFive: UIButton!
    
    var lastUncompletedLevel = 15
    
    @IBOutlet var LevelSelectionView: UIView!
    @IBOutlet weak var LevelContainerView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0...14 {
            if set[i].unlocked == false {
                lastUncompletedLevel = i
                break
            }
        }
        
        if lastUncompletedLevel <= 5 {
            worldState = 1
        }
        else if lastUncompletedLevel <= 10 {
            worldState = 2
        }
        else {
            worldState = 3
        }
        LevelContainerView.alpha = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 0,  repeats: false, block: { _ in
            
            UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
                self.LevelContainerView.alpha = 1.0}, completion: nil)
            self.createWorldView()
        })
    }
    
    func createWorldView() {
        
        
        imageView1.removeFromSuperview()
        imageView2.removeFromSuperview()
        imageView3.removeFromSuperview()
        imageView4.removeFromSuperview()
        imageView5.removeFromSuperview()
        imageView6.removeFromSuperview()
        imageView7.removeFromSuperview()
        imageView8.removeFromSuperview()
        imageView9.removeFromSuperview()
        imageView10.removeFromSuperview()
        
        LevelOne.alpha = 0
        LevelTwo.alpha = 0
        LevelThree.alpha = 0
        LevelFour.alpha = 0
        LevelFive.alpha = 0
        
        
        createWorldLabel()
        
        if worldState == 1 {
            levels = [0, 1, 2, 3, 4]
        } else if worldState == 2{
            levels = [5, 6, 7, 8, 9]
        } else {
            levels = [10, 11, 12, 13, 14]
        }
        LevelOne.setTitle("Level \(levels[0] + 1)", for: .normal)
        LevelTwo.setTitle("Level \(levels[1] + 1)", for: .normal)
        LevelThree.setTitle("Level \(levels[2] + 1)", for: .normal)
        LevelFour.setTitle("Level \(levels[3] + 1)", for: .normal)
        LevelFive.setTitle("Level \(levels[4] + 1)", for: .normal)
        
            
        if set[levels[0]].score > 0 {
            imageView1.frame = CGRect(x: 242, y: 312, width: 40, height: 40)
            LevelContainerView.addSubview(imageView1)
            imageView6.frame = CGRect(x: 130, y: 312, width: 40, height: 40)
            LevelContainerView.addSubview(imageView6)
            LevelOne.alpha = 1
        }
        else {
            LevelOne.alpha = 1
            LevelOne.isUserInteractionEnabled = true
        }
        
        if set[levels[1]].score > 0 {
            imageView2.frame = CGRect(x: 242, y: 399, width: 40, height: 40)
            LevelContainerView.addSubview(imageView2)
            imageView7.frame = CGRect(x: 130, y: 399, width: 40, height: 40)
            LevelContainerView.addSubview(imageView7)
            LevelTwo.alpha = 1
            LevelTwo.isUserInteractionEnabled = true
        }
        else if set[levels[1]].unlocked == false {
            LevelTwo.alpha = 0.4
            LevelTwo.isUserInteractionEnabled = false
        }
        else {
            LevelTwo.alpha = 1
            LevelTwo.isUserInteractionEnabled = true
        }
        
        if set[levels[2]].score > 0  {
            imageView3.frame = CGRect(x: 242, y: 486, width: 40, height: 40)
            LevelContainerView.addSubview(imageView3)
            imageView8.frame = CGRect(x: 130, y: 486, width: 40, height: 40)
            LevelContainerView.addSubview(imageView8)
            LevelThree.alpha = 1
            LevelThree.isUserInteractionEnabled = true
        }
        else if set[levels[2]].unlocked == false{
            LevelThree.alpha = 0.4
            LevelThree.isUserInteractionEnabled = false
        }
        else {
            LevelThree.alpha = 1
            LevelThree.isUserInteractionEnabled = true
        }
        
        if set[levels[3]].score > 0 {
            imageView4.frame = CGRect(x: 242, y: 573, width: 40, height: 40)
            LevelContainerView.addSubview(imageView4)
            imageView9.frame = CGRect(x: 130, y: 573, width: 40, height: 40)
            LevelContainerView.addSubview(imageView9)
            LevelFour.alpha = 1
            LevelFour.isUserInteractionEnabled = true
            }
        else if set[levels[3]].unlocked==false{
            LevelFour.alpha = 0.4
            LevelFour.isUserInteractionEnabled = false
        }
        else {
            LevelFour.alpha = 1
            LevelFour.isUserInteractionEnabled = true
        }
            
        if set[levels[4]].score > 0 {
            imageView5.frame = CGRect(x: 242, y: 660, width: 40, height: 40)
            LevelContainerView.addSubview(imageView5)
            imageView10.frame = CGRect(x: 130, y: 660, width: 40, height: 40)
            LevelContainerView.addSubview(imageView10)
            LevelFive.alpha = 1
            LevelFive.isUserInteractionEnabled = true
        }
        else if set[levels[4]].unlocked==false{
            LevelFive.alpha = 0.4
            LevelFive.isUserInteractionEnabled = false
        }
        else {
            LevelFive.alpha = 1
            LevelFive.isUserInteractionEnabled = true
        }
        
//        if worldState == 1 {
//            var flag = 0
//            for i in 0...5 {
//                if set[i].unlocked == false {
//                    flag = 1
//                }
//            }
//            if flag == 1 {
//
//            }
//            else {
//                HintLabel.alpha = 1
//            }
//
//        }
//        else if worldState == 2 {
//            var flag = 0
//            for i in 0...10 {
//                if set[i].unlocked == false {
//                    flag = 1
//                }
//            }
//            if flag == 1 {
//
//            }
//            else {
//                HintLabel.alpha = 1
//            }
//
//        }
//        else {
//            HintLabel.alpha = 0
//        }
    }
    
    func createWorldLabel() {
        myString = "World \(worldState)" as NSString
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "AppleSDGothicNeo-Light", size: 36.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:1,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: NSRange(location:2,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:3,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:4,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemIndigo, range: NSRange(location:5,length:1))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: NSRange(location:6,length:1))
        
        WorldLabel.attributedText = myMutableString
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidLoad()
        
        
        
        LevelSelectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeRight.direction = .right
        LevelSelectionView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeLeft.direction = .left
        LevelSelectionView.addGestureRecognizer(swipeLeft)
        
        loadData()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let imageName = "star.png"
        let image = UIImage(named: imageName)
        imageView1 = UIImageView(image: image!)
        imageView2 = UIImageView(image: image!)
        imageView3 = UIImageView(image: image!)
        imageView4 = UIImageView(image: image!)
        imageView5 = UIImageView(image: image!)
        imageView6 = UIImageView(image: image!)
        imageView7 = UIImageView(image: image!)
        imageView8 = UIImageView(image: image!)
        imageView9 = UIImageView(image: image!)
        imageView10 = UIImageView(image: image!)
        
        
        
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? GameViewController {
            dest.n = n
            dest.parentView = self
            
        }
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
    
    @IBAction func LevelOneButton(_ sender: Any) {
        
        SoundManager.instance.playSound(sound: .button)
        n = levels[0] + 1
        
        performSegue(withIdentifier: "ShowGame", sender: self)
        
    }
    
    @IBAction func LevelTwoButton(_ sender: Any) {
        
        SoundManager.instance.playSound(sound: .button)
        n = levels[1] + 1
        performSegue(withIdentifier: "ShowGame", sender: self)
    }
    
    @IBAction func LevelThreeButton(_ sender: Any) {
        SoundManager.instance.playSound(sound: .button)
        n = levels[2] + 1
        performSegue(withIdentifier: "ShowGame", sender: self)
    }
    
    @IBAction func LevelFourButton(_ sender: Any) {
        SoundManager.instance.playSound(sound: .button)
        n = levels[3] + 1
        performSegue(withIdentifier: "ShowGame", sender: self)
    }
    
    @IBAction func LevelFiveButton(_ sender: Any) {
        SoundManager.instance.playSound(sound: .button)
        n = levels[4] + 1
        performSegue(withIdentifier: "ShowGame", sender: self)
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
    
    func updateDatatbase(score: Int, id: Int, time: Float){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        set[id-1].score = Int32(score)
        set[id-1].stars = 1
        set[id-1].time = time
        set[id].unlocked = true
        do {
            try context.save()
        } catch {
            print("error updating level")
            
        }
    }

    func fadeInFadeOut() {
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
            self.LevelContainerView.alpha = 0.0}, completion: nil)
        SoundManager.instance.playSound(sound: .select)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.4,  repeats: false, block: { _ in
            
            UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
                self.LevelContainerView.alpha = 1.0}, completion: nil)
            self.createWorldView()
        })
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        // Current Frame
        var frame = LevelSelectionView.frame

        switch sender.direction {
        case .left:
            frame.origin.x -= 100.0
            frame.origin.x = max(0.0, frame.origin.x)
            if worldState == 1 {
                fadeInFadeOut()
                worldState = 2
                
                print("World Two")
            }
            else if worldState == 2 {
                fadeInFadeOut()
                worldState = 3
                print("World Three")
            }
            
        case .right:
            frame.origin.x += 100.0

            if frame.maxX > view.bounds.maxX {
                frame.origin.x = view.bounds.width - frame.width
            }
            
            if worldState == 2 {
                fadeInFadeOut()
                worldState = 1
                print("World One")
            }
            
            else if worldState == 3 {
                fadeInFadeOut()
                worldState = 2
                print("World Two")
            }
            
        default:
            break
        }

        UIView.animate(withDuration: 0.25) {
            self.LevelSelectionView.frame = frame
        }
    }
    
}
