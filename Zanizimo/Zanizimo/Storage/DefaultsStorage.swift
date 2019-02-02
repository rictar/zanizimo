//
//  DefaultsStorage.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 2/2/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

struct DefaultsStorage {
    static let location = "com.mx.rictar.Zanizimo."
    
    static func save(key:String,value:Any){
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: location.appending(key))
    }
    
    
    static func recover(key:String) -> String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: location.appending(key)) ?? ""
    }
    
    
    
}
