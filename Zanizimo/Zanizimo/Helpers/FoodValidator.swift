//
//  FoodValidator.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/27/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit


struct FoodValidator {
    
    static let sharedInstance = FoodValidator()  // singleton object
    private let model:food
    
    private init() {
        model = food()
    }
    
    func processImage(_ image: UIImage) -> Bool{
        let size = CGSize(width: 227, height: 227)
        
        
        guard let buffer = image.resize(to: size)?.pixelBuffer() else {
            fatalError("Scaling or converting to pixel buffer failed!")
        }
        guard let result = try? model.prediction(data: buffer) else {
            fatalError("Prediction failed!")
        }
        
        let confidence = result.prob["\(result.classLabel)"]! * 100.0
        
        
        return confidence >= 10
    }
    
    
}





