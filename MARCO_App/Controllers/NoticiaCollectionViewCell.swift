//
//  NoticiaCollectionViewCell.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 13/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit

class NoticiaCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var noticiaImage: UIImageView!
    @IBOutlet weak var noticiaTitle: UILabel!
    @IBOutlet weak var noticiaDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
