//
//  ShelfViewController.swift
//  Alexis
//
//  Created by Alexis Ruben Garcias Laborda on 26/01/18.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class ShelfViewController: BaseViewController {

    @IBOutlet weak var referenceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        referenceImage.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func btnSonTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .son)
    }
    
    @IBAction func btnBottlesTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .bottles)
    }
    
}
