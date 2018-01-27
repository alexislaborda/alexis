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
    
    var mainPageViewController: MainPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func mainImageSwipeLeft(_ sender: UISwipeGestureRecognizer) {
    
        if self.animatedImageView.animate(reverse: false) == true {
            
            mainPageViewController.changePage(direction: .forward)
        }
    }
    
    @IBAction func mainImagesSwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        if self.animatedImageView.animate(reverse: true) == true {
            
            mainPageViewController.changePage(direction: .reverse)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueName = segue.identifier
        if segueName == "pageControllerEmbed" {
            
            mainPageViewController = segue.destination as! MainPageViewController
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
