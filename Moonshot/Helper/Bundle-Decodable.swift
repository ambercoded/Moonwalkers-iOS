//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Adrian B. Haeske on 31.08.20.
//  Copyright © 2020 adrianhaeske. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ filename: String) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("No such file in the bundle with name: \(filename)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file \(filename) from Bundle")
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-mm-dd"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(filename)")
        }
        
        return decoded
    }
}
