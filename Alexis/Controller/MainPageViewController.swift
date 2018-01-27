//
//  MainPageViewController.swift
//  Alexis
//
//  Created by Alexis Ruben Garcias Laborda on 26/01/18.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var views = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tvView = storyboard?.instantiateViewController(withIdentifier: "tvView") else {return}
        guard let shelfView = storyboard?.instantiateViewController(withIdentifier: "shelfView") else {return}
        guard let officeView = storyboard?.instantiateViewController(withIdentifier: "officeView") else {return}
        guard let bedView = storyboard?.instantiateViewController(withIdentifier: "bedView") else {return}
        
        views.append(tvView)
        views.append(shelfView)
        views.append(officeView)
        views.append(bedView)
        
        setViewControllers([tvView], direction: .forward, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func changePage(direction: UIPageViewControllerNavigationDirection) {

        guard let currentViewController = viewControllers?.first else {return}
        guard let viewControllerIndex = views.index(of: currentViewController) else {return}
        
        var newViewController: UIViewController!
        
        if direction == .forward {
            
            newViewController = views[viewControllerIndex + 1]
        }
        else {

            newViewController = views[viewControllerIndex - 1]
        }
        
        setViewControllers([newViewController], direction: .forward, animated: false, completion: nil)
    }
}
