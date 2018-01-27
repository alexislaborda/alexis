//
//  ShelfViewController.swift
//  Alexis
//
//  Created by Alexis Ruben Garcias Laborda on 26/01/18.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController {

    @IBOutlet weak var referenceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        referenceImage.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
