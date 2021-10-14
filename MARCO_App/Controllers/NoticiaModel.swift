//
//  NoticiaModel.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 13/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import Foundation

struct NewsList: Codable {
    let noticias: [Noticia]
}

// MARK: - WelcomeElement
struct Noticia: Codable {
    let id, title, subtitle: String?
    let date, description: String?
    let imageUrl: String?
}
