//
//  CustomLabel.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 2/1/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {
        
    @IBInspectable var txtColor: UIColor = UIColor.white {
            didSet {
                self.textColor = txtColor
            }
        }
        
        func setup() {
            self.textColor = txtColor
        }
        
        override func awakeFromNib() {
            setup()
        }
        
        override func prepareForInterfaceBuilder() {
            setup()
        }

}
