//
//  ViewController.swift
//  Audio
//
//  Created by Hitesh V-PI on 12/06/17.
//  Copyright © 2017 Pixabit Infotech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var trackID: Int!
    var player : AVAudioPlayer!
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var txtLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       txtLable.text = "Track \("00:00")"
        let path: String! = Bundle.main.path(forResource: "0", ofType: "mp3")
        let mp3URL = NSURL(fileURLWithPath: path)
        let asset = AVURLAsset(url: NSURL(fileURLWithPath: path) as URL, options: nil)
        let audioduration = asset.duration
        let seconds : Float64 = CMTimeGetSeconds(audioduration)
        let minitue = seconds/60;
        
        
        txtLable.text = "\(Int(minitue)) : \(Int(seconds.truncatingRemainder(dividingBy: 60.00)))"
        
        


        do {
            /*
            player = try AVAudioPlayer(contentsOf: mp3URL as URL)
            player.prepareToPlay()
         */
            
 
         
            player = try AVAudioPlayer(contentsOf:URL.init(fileURLWithPath: Bundle.main.path(forResource: "0", ofType: "mp3")!))
            player.prepareToPlay()
            
          Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
           // progressView.setProgress(Float((player.currentTime)/(player.duration)), animated: true)
        }
        catch{
            print(error)
        }
        
        
        
 
        
    

    }
     
      
    
    @IBAction func Play(_ sender: UIButton) {
    
        if sender.isSelected {
            
            player.pause()
            
            sender.isSelected = false
            
        }
        else{
            
            
                player.play()
                sender.isSelected = true
            
            
            
        }
        
        
        
    
        
        
    
}

    func updateAudioProgressView()
    {
      if (player.isPlaying)
        {
     
            
        print(player.currentTime, player.duration)
            
            progressView.setProgress(Float(player.currentTime/player.duration), animated: true)
            
            
        }
        
        
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

    
    
    


