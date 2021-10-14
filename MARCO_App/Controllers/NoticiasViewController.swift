//
//  NoticiasViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 13/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit

class NoticiasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var noticias: [Noticia] = []
    
    
    @IBOutlet weak var noticiasGrid: UICollectionView!
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Noticias"
        
        noticiasGrid.delegate = self
        noticiasGrid.dataSource = self

        let nib = UINib(nibName: "NoticiaCollectionViewCell", bundle: nil)

        noticiasGrid.register(nib, forCellWithReuseIdentifier: "noticiaCollectionCell")
        
        
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
                print(noticias)
                self.noticiasGrid.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        noticias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noticiaCollectionCell", for: indexPath) as! NoticiaCollectionViewCell
        
        let noticia = noticias[indexPath.row]
        let name = noticia.title
        let date = noticia.date
        cell.noticiaTitle.text = name
        cell.noticiaDate.text = date
        
        
//        let url = URL(string: "")!
//        cell.obraImage.downloaded(from: url)
        cell.noticiaImage.image = UIImage(named: "Obra2")
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 325, height: 200)
       }
    
    
  

}
