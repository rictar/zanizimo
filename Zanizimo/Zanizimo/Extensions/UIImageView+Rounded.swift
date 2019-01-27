//
//  File.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/26/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width/5.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
