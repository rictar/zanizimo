//
//  d.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/29/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

struct DayMenu:Codable {
    
    let dayNumber:Int
    var dayMenu:[Meal]
    
    init(day: Int, menu: [Meal]) {
        self.dayNumber = day
        self.dayMenu = menu
    }
    
    mutating func check (day:Int){
        dayMenu[day].check()
    }
    
}
