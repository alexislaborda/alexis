//
//  BedViewController.swift
//  Alexis
//
//  Created by Alexis Laborda on 26/01/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class BedViewController: BaseViewController {

    @IBOutlet weak var referenceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        referenceImage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func btnStarWarsTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .starWars)
    }
    
}
