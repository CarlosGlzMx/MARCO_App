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
        
//        noticiasGrid.delegate = self
//        noticiasGrid.delegate = self
//
//        let nib = UINib(nibName: "", bundle: nil)
//
//        noticiasGrid.register(nib, forCellWithReuseIdentifier: "…")
        
        fetch()
        
    }

    func fetch(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/news", method:.get , parameters: nil, stringParameters: nil) {
            (event: [Noticia]?, error) in
            if error != nil
            {
                print(error ?? "Hubo un error misterioso")
                
            }
            else{
                guard let noticias = event else {return}
                self.noticias = noticias
                self.noticiasGrid.reloadData()
                print(noticias)
                self.noticiasGrid.reloadData()
            }
        }
    }
    
    
    
  

}
