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
    @IBOutlet weak var btnDoor: UIButton!
    
    let defaultAlpha = CGFloat(0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnDoor.alpha = self.defaultAlpha
        
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
    
    @IBAction func btnImageTouch(_ sender: UIButton) {
        
        blinkButton(button: self.btnDoor)
        
        /*
        UIView.animate(withDuration: 0.8) {
            self.btnDoor.alpha = 0.5
            self.btnDoor.alpha = self.defaultAlpha
        }*/
        
    }
    
    @IBAction func btnDoorTouch(_ sender: UIButton) {
        
        print("door")
    }
}
