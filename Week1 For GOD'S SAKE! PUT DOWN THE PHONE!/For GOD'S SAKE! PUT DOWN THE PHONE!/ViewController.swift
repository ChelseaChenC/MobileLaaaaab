//
//  ViewController.swift
//  For GOD'S SAKE! PUT DOWN THE PHONE!
//
//  Created by Chelsea Chen CHEN on 2/4/19.
//  Copyright © 2019 Chelsea Chen CHEN. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    

    
//    var player = AVAudioPlayer()
    var player: AVAudioPlayer?
    
    
 
    
    @IBAction func touchUp(_ sender: Any) {
        playSoundMP3()
    }
    
    @IBAction func touchDown(_ sender: Any) {
        pauseSoundMP3()
    }

  
    func playSoundMP3() {
        guard let url = Bundle.main.url(forResource: "1", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func pauseSoundMP3(){
        guard let player = player else { return }
        if player.isPlaying {
            player.pause()
        }
    }
    

}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
    return input.rawValue
}

