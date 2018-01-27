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
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var animatedImageView: AnimatedImageView!
    @IBOutlet weak var containerView: UIView!
    
    var mainPageViewController: MainPageViewController!
    
    var isShowingInitialView = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        updateLabelScore()
        lblDescription.text = ""
    }
    
    func changePage(direction: UIPageViewControllerNavigationDirection) {
    
        if isShowingInitialView == true {
            
            mainPageViewController.changePage(direction: .forward)
            isShowingInitialView = false
        }
        else {
            
            let reverse = direction == .reverse
            
            if self.animatedImageView.animate(reverse: reverse) == true {
                
                mainPageViewController.changePage(direction: direction)
            }
        }
    }
    
    @IBAction func mainImageSwipeLeft(_ sender: UISwipeGestureRecognizer) {
    
        changePage(direction: .forward)
    }
    
    @IBAction func mainImagesSwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        changePage(direction: .reverse)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueName = segue.identifier
        if segueName == "pageControllerEmbed" {
            
            mainPageViewController = segue.destination as! MainPageViewController
            mainPageViewController.mainViewController = self
        }
    }
    
    func updateLabelScore() {
        
        let si = Topics.sharedInstance
        lblScore.text = "Itens descobertos: \(si.countFounded())\\\(si.topics.count)"
    }
    
    func updateLabelDescription(topicNumber: TopicNumber) {
        
        let si = Topics.sharedInstance
        lblDescription.text = si.getDescription(topicNumber: topicNumber)
        
        updateLabelScore()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
