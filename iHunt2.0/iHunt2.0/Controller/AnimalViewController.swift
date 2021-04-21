//
//  AnimalViewController.swift
//  iHunt2.0
//
//  Created by Huma Naushad on 2021-04-14.
//

import UIKit
import AVFoundation

class AnimalViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    
    var animal : Animal?
    var player: AVAudioPlayer!
    var file : String?
    var isPlaying = false
    //var volume : Float =  1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Animal"
        
        nameLabel.text = self.animal?.name
        photoImageView.image = self.animal?.photo
        file = self.animal?.file
        
        volumeSlider.minimumValue = 1
        volumeSlider.maximumValue = 10
        volumeSlider.value = 2
        
        let url = Bundle.main.url(forResource: self.file, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
    }
    
    //var player = AVAudioPlayer()
    @IBAction func playPauseButton(_ sender: Any) {
     
        if (isPlaying) {
            player.pause()
            isPlaying = false
            playButton.setBackgroundImage(UIImage(systemName: "play"), for: UIControl.State.normal)
        } else {
            player.volume = volumeSlider.value
            player.play()
            isPlaying = true
            playButton.setBackgroundImage(UIImage(systemName: "pause"), for: UIControl.State.normal)
        }
    }
    

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        player.volume = volumeSlider.value
    }
    
}
