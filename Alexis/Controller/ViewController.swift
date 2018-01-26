//
//  ViewController.swift
//  Alexis
//
//  Created by Alexis Ruben Garcias Laborda on 23/01/18.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnImage: UIButton!

    var images = [UIImage]()
    
    let defaultAlpha = CGFloat(0.1)
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func blinkButton(button: UIButton) {

        UIView.animate(withDuration: 0.8) {
            button.alpha = 0.5
            button.alpha = self.defaultAlpha
        }
        
    }
    
    @IBAction func btnTouch(_ sender: UIButton) {
    
        for i in 0...84 {
            
            let image = UIImage(named: "quarto\(i)")
            //images.append()
            
        }
        
    }
    
    @IBAction func btnImageTouch(_ sender: UIButton) {
        
//        blinkButton(button: self.btnDoor)
        
    }
}
