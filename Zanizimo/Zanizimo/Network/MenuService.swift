//
//  MenuService.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 2/2/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation

class MenuService {
    static let shared = MenuService()
    
    let client = Client(baseURLComponents: URLComponents(string: "https://hidden-anchorage-43371.herokuapp.com")!)
    
    func all(completion: @escaping (WeekMenu) -> Void) {
        
        if let res = CodableStorage<WeekMenu>.permanent(filename: "weekMenu.json").load() {
            completion(res)
        }
        
        client.get(path: "/WeekMenu") { data in
            guard let data = data else { return }
            if let result = try? JSONDecoder().decode(WeekMenu.self, from: data) {
                CodableStorage<WeekMenu>.permanent(filename: "weekMenu.json").save(data: result)
                DispatchQueue.main.async { completion(result) }
            }
        }
    }
}
