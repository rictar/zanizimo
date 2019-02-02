//
//  Date+extension.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/27/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

extension Date{
    
    func getDay(_ day:Int) -> Date {
        
        let newDay = Date(timeInterval: TimeInterval(86400 * day), since: self)
        
        return newDay
    }
    
    func dayFormat(format:String) -> String{
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "es_MX")
        dateFormatter.dateFormat = format
        let dayInWeek = dateFormatter.string(from: self)
        return dayInWeek
    }
    
    func dayNumberInWeek() -> Int{
        return Calendar.current.component(.day, from: self)
    }
    
    func weekNumberInYear() -> Int{
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    func isCurrentDay() -> Bool{
        let currentDay = Calendar.current.component(.day, from: Date())
        let day = Calendar.current.component(.day, from: self)
        
        return day == currentDay
    }
    
    func isActualTime(hour:Int) -> Bool{
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        return self.isCurrentDay() && (hour >= currentHour - 1) && (hour <= currentHour+1)
        
    }
    
}
