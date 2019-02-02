//
//  WeekMenu.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/29/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

struct WeekMenu {
    let weekNumber:Int
    var weekMenu:[DayMenu]
    
    init(week: Int, menu: [DayMenu]) {
        self.weekNumber = week
        self.weekMenu = menu
    }
    
    func getMenuForDay(day:Int) -> DayMenu? {
        if let food = self.weekMenu.first(where: {$0.dayNumber == day}) {
            //food.dayMenu[0].check()
            
            return food
        }
        
        
        return nil
        

        
    }
    
    mutating func check(day:Int,meal:Int){
        weekMenu[day].check(day: meal)
        
    }
}
