//
//  String+CapitalizingFirstLetter.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/27/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
