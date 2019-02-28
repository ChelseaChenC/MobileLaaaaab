//
//  ListTableViewController.swift
//  dorp
//
//  Created by Chelsea Chen CHEN on 2/25/19.
//  Copyright © 2019 Chelsea Chen CHEN. All rights reserved.
//

import UIKit
import CoreMotion

class ListTableViewController: UITableViewController {
    
    let motionManager = CMMotionManager()
    var timer: Timer!
    var lastG: Double = 0
    var counter: Int = 1
    var lastUpdated: Date = Date()
    var dropEvents: [Date] = []
    var dateFormatter: DateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        
        motionManager.startAccelerometerUpdates()
        motionManager.startGyroUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
    }

    // MARK: - Table view data source
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
                    let date = Date()
                    let dateString = dateFormatter.string(from: date)
                    
                    print(dateString)
                    lastUpdated = Date()
                    dropEvents.append(lastUpdated)
                    self.tableView.reloadData()
                }
            }
            lastG = g
        }
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dropEvents.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "DropEventTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DropEventTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
//        print(indexPath.row)
        let dropEvent = dropEvents[indexPath.row]
        
        cell.dropInfo.text = dateFormatter.string(from: dropEvent)
        
        return cell
        
    }


}
