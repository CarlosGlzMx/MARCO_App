//
//  ObraCollectionViewCell.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 05/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit

class ObraCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var obraImage: UIImageView!
    @IBOutlet weak var obraTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        obraTitle.adjustsFontSizeToFitWidth = true
        obraTitle.minimumScaleFactor = 0.5
      
    }
    
    
}
