//
//  SlideModel.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/28/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

struct SlideModel{
    var imageName:String
    var labelTitle:String
    var labelDesc:String
    var buttonTitle:String
    var isVisible:Bool
    
    func toSlide() -> Slide {
        let slide :Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide.imageView.image = UIImage(named: self.imageName)
        slide.labelTitle.text = self.labelTitle
        slide.labelTitle.textColor = UIColor.white
        slide.labelDesc.text = self.labelDesc
        slide.labelDesc.textColor = UIColor.white
        if isVisible {
            slide.buttonNext.setTitle(buttonTitle, for: .normal)
            //slide.delegate = ViewController
            //slide.buttonNext.addTarget(self, action: #selector(self.notification), for: .touchUpInside)
        }else{
            slide.buttonNext.removeFromSuperview()
        }
        
        return slide
        
        
    }
    
    
}
