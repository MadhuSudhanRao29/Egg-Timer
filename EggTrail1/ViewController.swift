//
//  ViewController.swift
//  EggTrail1
//
//  Created by Madhu on 16/05/20.
//  Copyright © 2020 Madhu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
 
  // CREATING OUTLETS FOR LABEL AND PROGRESS BAR
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // ASSIGNING VALUES FOR COUNT THE TIME
    var totalTime    = 0
    var seconds      = 0
    
    // ASSIGNING TIMER
    var timer        = Timer()
    
    // CREATING VARIABLE FOR AUDIO
    var player       : AVAudioPlayer!
    
    
    // CREATING A DICTIONARY FOR EGGS BOILING TIME
    let eggTimes = ["Soft": 4, "Medium": 6, "Hard": 8]
    
    
    // CREATING SINGLE OUTLET FOR ALL BUTTONS
    @IBAction func buttonPressed(_ sender: UIButton)
   {
    
    // STOPS THE TIMER
    timer.invalidate()
    
    // ASSIGNING BUTTON PRESSED BY THE USER TO M
    let m = sender.currentTitle!
      
    titleLabel.text = m
    
    // ASSIGNING USER SELECTED TIME
    totalTime = eggTimes[m]!
    
    progressBar.progress = 0.0
    seconds              = 0
    
    // ALLOCATING TIMER
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    
    @objc func update()
    {
        // PERFORMING ACTIONS TO PROGRESS BAR
        if (seconds < totalTime)
        {
            seconds += 1
            
            progressBar.progress = Float(seconds)/Float(totalTime)
            
            print("Time Consumed Was \(progressBar.progress)")
        }
        else
        {
            // IF TOTAL TIME WAS COMPLETED THIS PART IS EXECUTED
            timer.invalidate()
            
            titleLabel.text = " EGG BOILING TIME IS COMPLETED"
            
            // ASSIGNING SOME MUSIC IF TOTAL TIME WAS COMPLETED
            let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
    }
}

