//
//  OfficeViewController.swift
//  Alexis
//
//  Created by Alexis Laborda on 26/01/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class OfficeViewController: BaseViewController {

    @IBOutlet weak var referenceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        referenceImage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func btnOldSignTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .oldSign)
    }
    
    @IBAction func btnProgrammingLifeTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .programmingLife)
    }
    
    @IBAction func btnHumidifierTouch(_ sender: UIButton) {
        
        mainViewController.updateLabelDescription(topicNumber: .humidifier)
    }
}
