//
//  AnimatedImage.swift
//  Alexis
//
//  Created by Alexis Laborda on 26/01/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class AnimatedImageView: UIImageView {

    var currentCameraPosition = 0
    var allImages = [UIImage]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        for i in 0...85 {
            
            let image = UIImage(named: "quarto\(i)")
            allImages.append(image!)
            
        }
        
        image = allImages[0]
        
    }

    func canAnimate(reverse: Bool) -> Bool {
        
        if self.isAnimating == true {
            
            return false
        }
        
        if reverse && self.currentCameraPosition == 0 {
            
            return false
        }
        
        if !reverse && self.currentCameraPosition == 3 {
            
            return false
        }
        
        return true
    }
    
    func animate(initialImageIndex: Int, finalImageIndex: Int, reverse: Bool) {
        
        var animationImages = [UIImage]()
        var count = 0
        
        for index in initialImageIndex...finalImageIndex {
        
            if reverse {
            
                animationImages.append(allImages[finalImageIndex - count])
                count += 1
            } else {
            
                animationImages.append(allImages[index])
            }
        }
        
        image = animationImages[ animationImages.count - 1]
        self.animationImages = animationImages
        animationDuration = 1.2
        animationRepeatCount = 1
        startAnimating()
    }
    
    func animate(reverse: Bool) -> Bool {
        
        if !canAnimate(reverse: reverse) {
            return false
        }
        
        if reverse {
            self.currentCameraPosition -= 1
        }
        
        var initialImageIndex = 0
        var finalImageIndex = 0
        
        switch self.currentCameraPosition {
        case 0:
            initialImageIndex = 0
            finalImageIndex = 31
            
        case 1:
            initialImageIndex = 31
            finalImageIndex = 58
            
        case 2, 3:
            initialImageIndex = 58
            finalImageIndex = 85
            
        default:
            assertionFailure("CurrentCameraPosition not expected.")
        }
        
        animate(initialImageIndex: initialImageIndex, finalImageIndex: finalImageIndex, reverse: reverse)
        
        if !reverse {
            
            self.currentCameraPosition += 1
        }
        
        return true
    }
}
