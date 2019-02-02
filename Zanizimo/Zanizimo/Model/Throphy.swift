//
//  Throphy.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/29/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

struct Throphy:Codable {
    let name:String
    let number:Int
    
    init(name: String) {
        
        self.name = name
        self.number = 0
    }
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}
