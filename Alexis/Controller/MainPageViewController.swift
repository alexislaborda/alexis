//
//  MainPageViewController.swift
//  Alexis
//
//  Created by Alexis Ruben Garcias Laborda on 26/01/18.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var mainViewController: ViewController!
    
    var views = [BaseViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views.append(getViewController(withIdentifier: "tvView")!)
        views.append(getViewController(withIdentifier: "shelfView")!)
        views.append(getViewController(withIdentifier: "officeView")!)
        views.append(getViewController(withIdentifier: "bedView")!)
        
        guard let initialView = storyboard?.instantiateViewController(withIdentifier: "initialView") else {return}
        
        setViewControllers([initialView], direction: .forward, animated: false, completion: nil)
    }
    
    func getViewController(withIdentifier: String) -> BaseViewController? {
        
        guard let view = storyboard?.instantiateViewController(withIdentifier: withIdentifier) as? BaseViewController else {return nil}
        
        view.mainViewController = mainViewController
        return view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func changePage(direction: UIPageViewControllerNavigationDirection) {

        guard let currentViewController = viewControllers?.first else {return}
        
        if let currentBaseViewController = currentViewController as? BaseViewController {
            
            guard let viewControllerIndex = views.index(of: currentBaseViewController) else {return}
            
            var newViewController: UIViewController!
            
            if direction == .forward {
                
                newViewController = views[viewControllerIndex + 1]
            }
            else {
                
                newViewController = views[viewControllerIndex - 1]
            }
            
            setViewControllers([newViewController], direction: .forward, animated: false, completion: nil)
        } else {
            
            setViewControllers([views.first!], direction: .forward, animated: false, completion: nil)
        }
    }
}
