//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    let soundFiles = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        var selectedSoundFileName : String = soundFiles[sender.tag - 1]
        playSound(soundsFile : selectedSoundFileName)
    }
    
    func playSound(soundsFile f: String) {
        let url = Bundle.main.url(forResource : f, withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
        } catch let error as Error {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }

}

