//
//  CustomTextField.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 2/1/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {

    @IBInspectable var txtColor: UIColor = UIColor.white {
        didSet {
            self.textColor = txtColor
        }
    }
    
    @IBInspectable var roundColor:UIColor = UIColor.white{
        didSet{
            self.layer.borderColor = roundColor.cgColor
        }
    }
    
    func setup() {
        self.textColor = txtColor
        self.layer.cornerRadius=8.0
        self.layer.masksToBounds=true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = roundColor.cgColor
    }
    
    override func awakeFromNib() {
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }

}
