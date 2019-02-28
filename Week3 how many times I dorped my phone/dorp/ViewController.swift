//
//  ViewController.swift
//  dorp
//
//  Created by Chelsea Chen CHEN on 2/25/19.
//  Copyright © 2019 Chelsea Chen CHEN. All rights reserved.


import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    var timer: Timer!
    var lastG: Double = 0
    var counter: Int = 1
    var lastUpdated: NSDate = NSDate()
    var dateFormatter: DateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.startAccelerometerUpdates()
        motionManager.startGyroUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    
    
    
    @objc func update() {
        
        func squarRoot(x: Double, y: Double, z: Double) -> Double{
            return (x*x + y*y + z*z).squareRoot()
        }
        
        if let deviceMotion = motionManager.deviceMotion {
            //            print(deviceMotion.userAcceleration)
            let g = squarRoot(x: deviceMotion.userAcceleration.x,
                              y: deviceMotion.userAcceleration.y,
                              z: deviceMotion.userAcceleration.z)
            
            if g >= 1.0 && (g - lastG)>0.8 {
                let timeInterval = lastUpdated.timeIntervalSinceNow
                //                print(timeInterval)
                if timeInterval < -1.0 {
                    counter += 1
                    print(counter)
                    dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
                    let date = Date()
                    let dateString = dateFormatter.string(from: date)
                    
                    print(dateString)
                    lastUpdated = NSDate()
                }
            }
            lastG = g
        }
    }
}



