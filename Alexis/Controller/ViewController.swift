//
//  ViewController.swift
//  Alexis
//
//  Created by Alexis Ruben Garcias Laborda on 23/01/18.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var animatedImageView: AnimatedImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView = storyboard?.instantiateViewController(withIdentifier: "tvViewController").view
        
    }
    
    @IBAction func mainImageSwipeLeft(_ sender: UISwipeGestureRecognizer) {
    
        self.animatedImageView.animate(reverse: false)
    }
    
    @IBAction func mainImagesSwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        self.animatedImageView.animate(reverse: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
