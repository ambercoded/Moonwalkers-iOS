//
//  Astronauts.swift
//  Moonshot
//
//  Created by Adrian B. Haeske on 31.08.20.
//  Copyright © 2020 adrianhaeske. All rights reserved.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
}
