//
//  TVViewController.swift
//  Alexis
//
//  Created by Alexis Laborda on 26/01/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class TVViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var teste: UIButton!
    
    @IBAction func touchteste(_ sender: Any) {
        
        print("bla")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
