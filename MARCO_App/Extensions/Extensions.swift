//
//  Extensions.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 20/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
