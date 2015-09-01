//
//  ViewController.swift
//  Simone
//
//  Created by Ben Russell on 8/20/15.
//  Copyright (c) 2015 Ben Russell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Creat 2 arrays one for given problem sequence and one for reponse sequence
    var problemSequence = [Int]()
    var responseSequence = [Int]()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var tapView0: UIView!
    @IBOutlet weak var tapView1: UIView!
    @IBOutlet weak var tapView2: UIView!
    @IBOutlet weak var tapView3: UIView!
    
    // Create TapGestureRecognizer
    let tapRec0 = UITapGestureRecognizer()
    let tapRec1 = UITapGestureRecognizer()
    let tapRec2 = UITapGestureRecognizer()
    let tapRec3 = UITapGestureRecognizer()
    
    // Score and Level Counters
    var score = 0
    var level = 0
    var difficulty = 0
    
    
    var tapViewArray = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "Hit start to play"
        self.scoreLabel.text = String(score)
        
        tapViewArray = [tapView0, tapView1, tapView2, tapView3]
        tapRec0.addTarget(self, action: "tappedView0")
        tapView0.addGestureRecognizer(tapRec0)
        tapView0.userInteractionEnabled = true
        tapRec1.addTarget(self, action: "tappedView1")
        tapView1.addGestureRecognizer(tapRec1)
        tapRec2.addTarget(self, action: "tappedView2")
        tapView1.userInteractionEnabled = true
        tapView2.addGestureRecognizer(tapRec2)
        tapView2.userInteractionEnabled = true
        tapRec3.addTarget(self, action: "tappedView3")
        tapView3.addGestureRecognizer(tapRec3)
        tapView3.userInteractionEnabled = true    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startButton(sender: AnyObject) {
        
        switch level
        {
        case 0,1,2,3,4:
            difficulty = 4
        case 6,7,8,9,10:
            difficulty = 5
        case 11,12,13,14,15:
            difficulty = 6
        case 16,17,18,19,20:
            difficulty = 7
        case 21,22,23,24,25:
            difficulty = 8
        default:
            self.label.text = "YOU WON!😀😎😃😄"
        
        }
        responseSequence = []
        problemSequence = makeSequence(difficulty)
         // problemSequence = [0,2,2,2,3]
        self.label.text = "Watch sequence!"
        
        var currentDelay = 0.0
        
        for (number) in problemSequence {
            
            
            var currentView: UIView
            
            
            
            switch number
            {
            case 0:
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView0()
                }
                
            case 1:
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView1()
                }
            case 2:
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView2()
                }
            case 3:
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView3()
                }
            default:
                println("Whoops")
            }
            
             currentDelay = currentDelay + 1.0
            
            
            
            
        }
        
        

    }
    
    @IBAction func submitButton(sender: AnyObject) {
        if (problemSequence == responseSequence){
            self.label.text = "CORRECT!😀 Let's go again!"
            score += 1
            level += 1
            self.scoreLabel.text = String(score)
        } else {
            self.label.text = "Whoops, try again.😢"
            score -= 1
            self.scoreLabel.text = String(score)
            responseSequence = []
        }
    }
    func tappedView0(){
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView0.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView0.alpha = 1.0}, completion: nil)})
        println("You tapped view0!")
        responseSequence.append(0)
    }
    
    func tappedView1(){
        
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView1.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView1.alpha = 1.0}, completion: nil)})
        println("You tapped view1!")
        responseSequence.append(1)
    }
    
    func tappedView2(){
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView2.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView2.alpha = 1.0}, completion: nil)})
        println("You tapped view2!")
        responseSequence.append(2)
    }
    
    func tappedView3(){
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView3.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView3.alpha = 1.0}, completion: nil)})
        println("You tapped view3!")
        responseSequence.append(3)
    }
    
    func makeSequence(n:Int) -> [Int]{
        var result:[Int] = []
        for i in 0..<n {
            result.append(Int((arc4random_uniform(20) + 1)%4))
        }
        return result
    }
    

    func highLightView0()
    {
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView0.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView0.alpha = 1.0}, completion: nil)})
    }
    
    func highLightView1()
    {
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView1.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView1.alpha = 1.0}, completion: nil)})
    }
    
    func highLightView2()
    {
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView2.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView2.alpha = 1.0}, completion: nil)})
    }
    
    func highLightView3()
    {
        UIView.animateWithDuration(0.5, delay: 0,
            options: nil,
            animations: {self.tapView3.alpha = 0.5},
            completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {self.tapView3.alpha = 1.0}, completion: nil)})
    }

    @IBAction func resetButton(sender: AnyObject) {
        score = 0
        level = 0
        self.label.text = "Hit start to play"
        self.scoreLabel.text = String(score)
    }

}







