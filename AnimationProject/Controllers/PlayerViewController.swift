//
//  PlayerViewController.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/17/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var isPlaying = false

    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func play(path: String) {
        let url = URL(fileURLWithPath: path)
        do {
            isPlaying = true
            
            player = try AVAudioPlayer(contentsOf: url)
            
            player.volume = volumeSlider.value
            player.play()
            
        } catch {
            // couldn't load file
        }
    }

    @IBAction func volumeValueChanged(_ sender: UISlider) {
        player.volume = sender.value
    }
    
    @IBAction func playMetallicaButtonTouched(_ sender: UIButton) {
        volumeSlider.isEnabled = true
        
        let path = Bundle.main.path(forResource: "Metallica.mp3", ofType: nil)!
        
        play(path: path)
    }
    
    @IBAction func playNirvanaButtonTouched(_ sender: UIButton) {
        volumeSlider.isEnabled = true
        
        let path = Bundle.main.path(forResource: "Nirvana.mp3", ofType: nil)!
        
        play(path: path)
    }
    
    @IBAction func playAcDcButtonTouched(_ sender: UIButton) {
        volumeSlider.isEnabled = true
        
        let path = Bundle.main.path(forResource: "acdc.mp3", ofType: nil)!
        
        play(path: path)
    }
    
    @IBAction func playRollingStonesButtonTouched(_ sender: UIButton) {
        volumeSlider.isEnabled = true
        
        let path = Bundle.main.path(forResource: "TheRollingStones.mp3", ofType: nil)!
        
        play(path: path)
    }
    
    @IBAction func playTheBeatlesButtonTouched(_ sender: UIButton) {
        volumeSlider.isEnabled = true
        
        let path = Bundle.main.path(forResource: "TheBeatles.mp3", ofType: nil)!
        
        play(path: path)
    }
    
    @IBAction func pauseButtonTouched(_ sender: UIButton) {
        volumeSlider.isEnabled = false
        if isPlaying {
            isPlaying = false
            
            player.pause()
        }
    }
}
