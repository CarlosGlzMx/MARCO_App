//
//  NoticiasViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 13/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit

class NoticiasViewController: UIViewController {
    
    var noticias: [Noticia] = []
    
    
    @IBOutlet weak var noticiasGrid: UICollectionView!
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Noticias"

        // Do any additional setup after loading the view.
    }

    
    
    
    
  

}
