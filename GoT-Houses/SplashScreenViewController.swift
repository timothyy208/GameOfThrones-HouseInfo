//
//  SplashScreenViewController.swift
//  GoT-Houses
//
//  Created by Timothy Yang on 4/8/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import UIKit
import AVFoundation
class SplashScreenViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    @IBOutlet weak var splashImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundName: "GoT_theme", audioPlayer: &audioPlayer)
        UIView.animate(withDuration: 1, animations: {self.splashImage.frame.origin.y = -(self.splashImage.frame.size.height)})
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        checkStopMusic {
            self.performSegue(withIdentifier: "ShowTableView", sender: self)
        }
        
        
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("error")
            }
        } else {
            print ("error2")
        }
    }
    
    func checkStopMusic(completed: @escaping () -> ()) {
        if audioPlayer.isPlaying == true {
            audioPlayer.stop()
        }
        completed()
    }
    
}
