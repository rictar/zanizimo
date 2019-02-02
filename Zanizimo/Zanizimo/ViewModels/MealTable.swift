//
//  ViewMeal.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/30/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

struct MealTable {
    var sectionName : String!
    var sectionObjects : [MealCell]!
    var sectionLabel : String!
    
    init(sectionName: String, sectionObjects: [MealCell]) {
        self.sectionName = sectionName
        self.sectionObjects = sectionObjects
    }
    
    init(sectionName: String, sectionLabel: String) {
        self.sectionName = sectionName
        self.sectionLabel = sectionLabel
    }
}
