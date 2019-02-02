//
//  CodableStorage.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 2/2/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation


enum CodableStorage<T> where T: Codable {
    case permanent(filename: String)
    case cache
    
    var filePath: URL? {
        switch self {
        case .permanent(let filename):
            var filePath = StorageType.permanent.folder
            filePath.appendPathComponent(filename)
            return filePath
        default:
            return nil
        }
    }
    
    func load() -> T? {
        switch self {
        case .permanent(_):
            guard let data = try? Data(contentsOf: self.filePath!) else { return nil }
            return try? JSONDecoder().decode(T.self, from: data)
        default:
            print("Unable to load filepath: \(String(describing: self.filePath))")
            return nil
        }
    }
    
    func save(data dataSource: T) {
        switch self {
        case .permanent(_):
            if let data = try? JSONEncoder().encode(dataSource) {
                try? data.write(to: self.filePath!)
            }
        default:
            print("Unaviable save storage")
        }
    }
}
