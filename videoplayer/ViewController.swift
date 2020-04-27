//
//  ViewController.swift
//  videoplayer
//
//  Created by Resembrink Correa on 4/23/20.
//  Copyright © 2020 reloader. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
    }

    @IBAction func buttonAction(_ sender: Any) {
        ShowVideo()
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
    }
    
    func ShowVideo() {
        if let path = Bundle.main.path(forResource: "developer", ofType: "mp4")
        {
            let video = AVPlayer(url:   URL(fileURLWithPath: path))
            let videoplayer = AVPlayerViewController()
            videoplayer.player = video
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
            
            videoplayer.showsPlaybackControls=false
            videoplayer.videoGravity = AVLayerVideoGravity.resize
            present(videoplayer, animated: true, completion: {
                video.play()
            })
            
            
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // con un evento touch
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation") // girar pantalla
        
        guard let path = Bundle.main.path(forResource: "developer", ofType: "mp4") else {return}
        
        let videoURL = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        playerViewController.showsPlaybackControls=false
        playerViewController.videoGravity = AVLayerVideoGravity.resize
        
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }
    
    
    
}

