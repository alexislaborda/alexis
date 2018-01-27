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

class TVViewController: UIViewController {

    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var videoView: UIView!

    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var lastRandom = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        referenceImage.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        stopVideo()
    }
    
    @objc func playerItemReachEnd(notification: NSNotification) {
        player.seek(to: kCMTimeZero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func stopVideo() {

        if player != nil {
            player.pause()
            videoView.layer.sublayers?.removeAll()
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
    
    @IBAction func btnMusicTouch(_ sender: UIButton) {
        stopVideo()
        
        let videoNumber = getRandom(upper_bound: 4)
        let videoURL = Bundle.main.url(forResource: "music\(videoNumber)", withExtension: "m4a")
        
        player = AVPlayer.init(url: videoURL!)
        player.actionAtItemEnd = .none
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        playerLayer.frame = videoView.bounds
        
        player.play()
        videoView.layer.position = videoView.center
        videoView.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime , object: player.currentItem)
        
    }
    
    @IBAction func btnVideoTouch(_ sender: UIButton) {
        
        stopVideo()
        
        let videoNumber = getRandom(upper_bound: 3)
        let videoURL = Bundle.main.url(forResource: "video\(videoNumber)", withExtension: "3gp")
        
        player = AVPlayer.init(url: videoURL!)
        player.actionAtItemEnd = .none
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        playerLayer.frame = videoView.bounds
        
        player.play()
        videoView.layer.position = videoView.center
        videoView.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime , object: player.currentItem)
        
    }
}
