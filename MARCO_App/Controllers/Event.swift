//
//  Events.swift
//  MARCO_App
//
//  Created by Ana Fernanda on 13/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import Foundation

struct Event: Codable {
    let id: String
    let events: [String]
    let date: String
}

typealias Events = [Event]
