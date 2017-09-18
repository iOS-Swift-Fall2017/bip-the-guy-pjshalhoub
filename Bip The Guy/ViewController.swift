//
//  ViewController.swift
//  Bip The Guy
//
//  Created by PJ Shalhoub on 9/15/17.
//  Copyright © 2017 PJ Shalhoub. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Functions
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        // shrink imageToPunch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x+shrinkValue, y: self.imageToPunch.bounds.origin.y+shrinkValue, width: self.imageToPunch.bounds.size.width-shrinkValue, height: self.imageToPunch.bounds.size.height-shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds}, completion:nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) { // use "inout" if we are going to pass in something that needs to be mutable
        // Now this is a function with mutable parameters
        // Note: we have to pass in a mutable value! Passing in a number, let constant or literal (like a String) will result in an error. Need to pass in varible type values
        // Can we load in a file sound name?
        if let sound  = NSDataAsset(name: soundName) {
            // check if sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        } else {
            // if reading in the NSDataAsset did not work, tell the user / report the error
            print("ERROR: file \(soundName) did not load")
        }
    }
    
    // MARK: Actions
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
       animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
        
    }
    @IBAction func libraryPressed(_ sender: UIButton) {
        
    }
}

