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
    
    
    @IBOutlet weak var tapView0: UIView!
    @IBOutlet weak var tapView1: UIView!
    @IBOutlet weak var tapView2: UIView!
    @IBOutlet weak var tapView3: UIView!
    
    // Create TapGestureRecognizer
    let tapRec0 = UITapGestureRecognizer()
    let tapRec1 = UITapGestureRecognizer()
    let tapRec2 = UITapGestureRecognizer()
    let tapRec3 = UITapGestureRecognizer()
    
    var tapViewArray = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapViewArray = [tapView0, tapView1, tapView2, tapView3]
        tapRec0.addTarget(self, action: "tappedView")
        tapView0.addGestureRecognizer(tapRec0)
        tapView0.userInteractionEnabled = true
        tapRec1.addTarget(self, action: "tappedView")
        tapView1.addGestureRecognizer(tapRec1)
        tapRec2.addTarget(self, action: "tappedView")
        tapView1.userInteractionEnabled = true
        tapView2.addGestureRecognizer(tapRec2)
        tapView2.userInteractionEnabled = true
        tapRec3.addTarget(self, action: "tappedView")
        tapView3.addGestureRecognizer(tapRec3)
        tapView3.userInteractionEnabled = true    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startButton(sender: AnyObject) {
         problemSequence = makeSequence(5)
         // problemSequence = [0,2,2,2,3]
        
        var currentDelay = 0.0
        
        for (number) in problemSequence {
            
            // highlightView(number)
            
            //            let myTimer = NSTimer(timeInterval: 0.5, target: self, selector: Selector("highlightView:"), userInfo: nil, repeats: true)
            //            NSRunLoop.currentRunLoop().addTimer(myTimer, forMode: NSRunLoopCommonModes)
            var currentView: UIView
            
            
            
            switch number
            {
            case 0:
                
                // highlightView(0, delay: currentDelay)
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView0()
                }
                
            case 1:
                
                // highlightView(1, delay: currentDelay)
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView1()
                }
            case 2:
                
                // highlightView(2, delay: currentDelay)
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView2()
                }
            case 3:
                
                // highlightView(3, delay: currentDelay)
                let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(currentDelay * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.highLightView3()
                }
            default:
                println("Whoops")
            }
            
             currentDelay = currentDelay + 1.0
            
            // NSThread .sleepForTimeInterval(1.0)
            
            
        }
        
        

    }
    
    func tappedView(){
        println("You tapped a view!")
    }
    
    func makeSequence(n:Int) -> [Int]{
        var result:[Int] = []
        for i in 0..<n {
            result.append(Int((arc4random_uniform(20) + 1)%4))
        }
        return result
    }
    
    func highlightView(n:Int, delay: NSTimeInterval) {
        let view = tapViewArray[n]
        
                UIView.animateWithDuration(0.5, delay: delay,
                                              options: nil,
                                           animations: {view.alpha = 0.5},
                    completion: {BOOL in UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {view.alpha = 1.0}, completion: nil)})
        
//        UIView.animateAndChainWithDuration(0.5, delay: delay,
//            options: nil,
//            animations: {view.alpha = 0.5},
//            completion: nil).animateWithDuration(0.5, delay: 0.0, options: nil, animations: {view.alpha = 1.0}, completion: nil)
        //        UIView.animateWithDuration(0.5, delay: delay, options:nil, animations: {view.alpha = 0.5}, completion: nil).animateWithDuration(0.5, animations: {view.alpha = 1.0})
        
        
    }
    
    func spacer(){
        println("spacer")
    }
    
    
    //    func highlightSequence(sequence: [Int]) {
    //        if let nextHighlight = sequence.first {
    //            let view = tapViewArray[nextHighlight]
    //
    //            UIView.animateWithDuration(0.5, animations: { view.alpha = 0.5 }, completion: {
    //                 _ in
    //                self.highlightSequence(sequence[1..<sequence.count])
    //            })
    //        }
    //    }
    
    
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
}





