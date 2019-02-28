//
//  ViewController.swift
//  Unlock
//
//  Created by Chelsea Chen CHEN on 2/13/19.
//  Copyright © 2019 Chelsea Chen CHEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var radians1 = Float()
    var degrees1 = Float()
    var radians2 = Float()
    var degrees2 = Float()
    var radians3 = Float()
    var degrees3 = Float()
    
    var angle1 = [CGFloat.pi / 3,
                  CGFloat.pi * 2 / 3,
                  CGFloat.pi,
                  CGFloat.pi * 4 / 3,
                  CGFloat.pi * 5 / 3,
                  CGFloat.pi * 2]
    
    
    var angle2 = [CGFloat.pi / 3,
                  CGFloat.pi * 2 / 3,
                  CGFloat.pi,
                  CGFloat.pi * 4 / 3,
                  CGFloat.pi * 5 / 3,
                  CGFloat.pi * 2]
    
    
    var angle3 = [CGFloat.pi / 3,
                  CGFloat.pi * 2 / 3,
                  CGFloat.pi,
                  CGFloat.pi * 4 / 3,
                  CGFloat.pi * 5 / 3,
                  CGFloat.pi * 2]
    
    var angleIndex1 = 0
    var angleIndex2 = 0
    var angleIndex3 = 0
    
    
    @IBOutlet weak var lable: UILabel!
    

    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button0: UIButton!
    

    
    
    func turn() {
        if (Double(degrees1) != 0.0 && Double(degrees2) != 0.0
            && Double(degrees3) != 0.0) {
            if(self.angleIndex1 == 2 &&
                self.angleIndex2 == 1 &&
                self.angleIndex3 == 4){
                
                
                UIView.animate(withDuration: 0.8,
                               animations:({
                                self.button0.transform =
                                CGAffineTransform(scaleX: 2000, y: 2000)
                               }))


                self.lable.text = " 💖💖💖💖"
                button1.setTitle("HAPPY", for: .normal)
                button2.setTitle("V-day", for: .normal)
                button3.setTitle("!!!", for: .normal)

            } else {
                self.lable.text = "☹️"
                
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.1
                animation.repeatCount = 5
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(
                            x: self.self.lable.center.x - 5,
                            y: self.self.lable.center.y))
                
                self.lable.layer.add(animation,
                    forKey: "positon")
            }
        }
        
        print (Double(degrees1), Double(degrees2), Double(degrees3))
    }
    
    
    
    @IBAction func button1(_ sender: Any) {
        
        
//        button1.backgroundImage(for: <#T##UIControl.State#>)
        UIView.animate(withDuration: 0.5, animations: ({
            self.button1.transform = CGAffineTransform(rotationAngle: self.angle1[self.angleIndex1])
        }))
        
        angleIndex1 += 1
        
        if angleIndex1 > 5{
            angleIndex1 = 0
        }
        
        radians1 = atan2f(Float(button1.transform.b),
        Float(button1.transform.a))
        
        degrees1 = radians1 * Float((180 / Double.pi));
        
        turn()
    }
    
    
    @IBAction func button2(_ sender: Any) {
        //        button1.backgroundImage(for: <#T##UIControl.State#>)
        UIView.animate(withDuration: 0.5, animations: ({
            self.button2.transform = CGAffineTransform(rotationAngle: self.angle2[self.angleIndex2])
        }))
        
        angleIndex2 += 1
        
        if angleIndex2 > 5{
            angleIndex2 = 0
        }
        
        radians2 = atan2f(Float(button2.transform.b),
                          Float(button2.transform.a))
        
        degrees2 = radians2 * Float((180 / Double.pi));
        
        turn()
    }
    
    
    @IBAction func button3(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: ({
            self.button3.transform = CGAffineTransform(rotationAngle: self.angle3[self.angleIndex3])
        }))
        
        angleIndex3 += 1
        
        if angleIndex3 > 5{
            angleIndex3 = 0
        }
        
        radians3 = atan2f(Float(button3.transform.b),
                          Float(button3.transform.a))
        
        degrees3 = radians3 * Float((180 / Double.pi));
        
        turn()
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        button1.layer.cornerRadius = 30
        button2.layer.cornerRadius = 30
        button3.layer.cornerRadius = 30

        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

