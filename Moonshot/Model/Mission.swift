//
//  Missions.swift
//  Moonshot
//
//  Created by Adrian B. Haeske on 01.09.20.
//  Copyright © 2020 adrianhaeske. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    var id: Int
    var crew: [CrewRole]
    var description: String
    var launchDate: Date?
    
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var formattedLaunchDate: String {
        if let safeLaunchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            
            return formatter.string(from: safeLaunchDate)
        } else {
            return "It never launched."
        }
    }
    
    
}
