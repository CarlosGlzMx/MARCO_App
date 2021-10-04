//
//  ExposicionModel.swift
//  MARCO_App
//
//  Created by Alumno on 04/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct ExpoList: Codable {
    let exposiciones: [Exposicion]
}

// MARK: - WelcomeElement
struct Exposicion: Codable {
    let id, title, startDate: String?
    let cerraduria, museografia, salas, tecnica: String?
    let obras: String?
    let recorridoVirtual, videoURL: String?
}
