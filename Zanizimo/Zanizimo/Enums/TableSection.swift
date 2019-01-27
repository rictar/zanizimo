//
//  TableSection.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/27/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

enum TableSection: Int {
    case breakfast = 0, snackOne, lunch, snackTwo,dinner, total
    
    func name() ->String {
        
        switch self {
        case .breakfast:
            return "Breakfast"
        case .snackOne:
            return "Snack One"
        case .lunch:
            return "Lunch"
        case .snackTwo:
            return "Snack Two"
        case .dinner:
            return "Dinner"
        default:
            return ""
        }
        
    }
}
