//
//  exposicionesViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 24/08/21.
//

import UIKit

class exposicionesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var exposiciones: [Exposicion] = []
    
    @IBOutlet weak var obrasGrid: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Exposiciones"

        obrasGrid.delegate = self
        obrasGrid.dataSource = self
        
        fetch()
        
        let nib = UINib(nibName: "ObraCollectionViewCell", bundle: nil)
        
        obrasGrid.register(nib, forCellWithReuseIdentifier: "obraCollectionCell")
    }
    
    func fetch(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/expositions", method:.get , parameters: nil, stringParameters: nil) {
            (event: [Exposicion]?, error) in
            if error != nil
            {
                print(error ?? "Hubo un error misterioso")
                
            }
            else{
                guard let exposiciones = event else {return}
                self.exposiciones = exposiciones
                print(exposiciones)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exposiciones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "obraCollectionCell", for: indexPath) as! ObraCollectionViewCell
        
        let obra = exposiciones[indexPath.row]
        let name = obra.title
        cell.obraTitle = name
        
//        let url = URL(string: "")!
//        cell.obraImage.downloaded(from: url)
        cell.obraImage = UIImage(named: "Obra1")
        
        
        return cell
    }

   
}
