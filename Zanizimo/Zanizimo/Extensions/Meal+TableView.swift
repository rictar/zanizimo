//
//  Meal+TableView.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/30/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit
extension Meal{
    
    func transformToViewMeal(schedule:String) -> [MealTable] {
        var viewMealArray = [MealTable]()
        let name = MealTable(sectionName: "Name", sectionLabel: self.name)
        viewMealArray.append(name)
        
        let schedule = MealTable(sectionName: "Schedule", sectionLabel: schedule)
        viewMealArray.append(schedule)
        
        let classification = MealTable(sectionName: "Classification", sectionLabel: self.classification)
        
        viewMealArray.append(classification)
        
        var viewCells = [MealCell]()
        for (key, value) in self.ingredients {
            let viewCell = MealCell(name:key,description:String(value))
            viewCells.append(viewCell)
        }
        
        
        viewMealArray.append(MealTable(sectionName: "Ingredients", sectionObjects: viewCells))
        
        return viewMealArray
    }
}


