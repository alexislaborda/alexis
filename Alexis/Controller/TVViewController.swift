//
//  TVViewController.swift
//  Alexis
//
//  Created by Alexis Laborda on 26/01/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class TVViewController: BaseViewController {

    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var videoView: UIView!

    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var isPlayingVideo = false
    var lastRandom = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        referenceImage.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        if isPlayingVideo == true {
        
            stopPlayer()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func stopPlayer() {

        if player != nil {
            player.pause()
            videoView.layer.sublayers?.removeAll()
            isPlayingVideo = false
        }
    }
    
    func getRandom(upper_bound: UInt32) -> Int {
        
        var randomNumber = lastRandom
        
        while randomNumber == lastRandom {
            
            randomNumber = Int(arc4random_uniform(upper_bound))
        }
        
        lastRandom = randomNumber
        return randomNumber
    }
    
    func playMedia(prefix: String, upper_bound: UInt32, withExtension: String) {
        
        stopPlayer()
        
        let videoNumber = getRandom(upper_bound: upper_bound)
        let videoURL = Bundle.main.url(forResource: prefix + "\(videoNumber)", withExtension: withExtension)
        
        player = AVPlayer.init(url: videoURL!)
        player.actionAtItemEnd = .none
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        playerLayer.frame = videoView.bounds
        
        player.play()
        videoView.layer.position = videoView.center
        videoView.layer.insertSublayer(playerLayer, at: 0)
    }
    
    @IBAction func btnMusicTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .music)
        
        playMedia(prefix: "music", upper_bound: 4, withExtension: "m4a")
        isPlayingVideo = false
    }
    
    @IBAction func btnVideoTouch(_ sender: UIButton) {
     
        mainViewController.updateLabelDescription(topicNumber: .video)
        
        playMedia(prefix: "video", upper_bound: 3, withExtension: "3gp")
        isPlayingVideo = true
    }
    
    @IBAction func btnHotWheelsTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .hotWheels)
    }
    
    
    @IBAction func btnAntiqueTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .antique)
    }
    
}
