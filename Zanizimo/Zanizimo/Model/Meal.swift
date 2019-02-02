//
//  Meal.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/29/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

struct Meal:Codable {
    let name : String
    let classification : String
    var isChecked : Bool?
    var imageUrlString: String?
    let typeMeal : TypeMeal
    let ingredients: [String: Int]
    
    
    init(name: String, classification: String,typeMeal:TypeMeal,ingredients: [String: Int]) {
        self.name = name
        self.classification = classification
        self.typeMeal = typeMeal
        self.isChecked = false
        self.imageUrlString = nil
        self.ingredients = ingredients
    }
    
    private var imageURL: URL? {
        guard let url = imageUrlString else { return nil }
        return URL(string: url)
    }
    
    private var imageData: Data? {
        guard let url = imageURL else { return nil }
        do {
            return try Data(contentsOf: url)
        } catch {
            return nil
        }
    }
    
    func getImage(completion: @escaping (UIImage) -> Void) {
        if let img = ImageStore.shared.image(forKey: self.name) {
            completion(img)
        }else{
        DispatchQueue.global(qos: .background).async {
            if let imgData = try? Data(contentsOf: self.imageURL!),
                let img = UIImage(data: imgData) {
                DispatchQueue.main.async { completion(img) }
                ImageStore.shared.setImage(img, forKey: self.name)
            }
            }}
    }
    
    mutating func check() {
        isChecked = true
    }
    
    
}
