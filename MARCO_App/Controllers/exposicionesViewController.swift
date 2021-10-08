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
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Exposiciones"

        obrasGrid.delegate = self
        obrasGrid.dataSource = self
        
        
        let nib = UINib(nibName: "ObraCollectionViewCell", bundle: nil)
        
        //Register cells
        obrasGrid.register(nib, forCellWithReuseIdentifier: "obraCollectionCell")
        
        //SetupGrid view
        self.setupGridView()
        
        //Obtain information from API
        fetch()
        
    }
    
    //For Layout and Grid del Collection View
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.setupGridView()
        DispatchQueue.main.async {
            self.obrasGrid.reloadData()
        }

    }
    
    //For Layout and Grid del Collection View
    func setupGridView(){
        let flow = obrasGrid?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
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
                self.obrasGrid.reloadData()
                print(exposiciones)
                self.obrasGrid.reloadData()
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
        cell.obraTitle.text = name
        
//        let url = URL(string: "")!
//        cell.obraImage.downloaded(from: url)
        cell.obraImage.image = UIImage(named: "Obra1")
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let obra = exposiciones[indexPath.row]
        
        let obraDetailViewController = ObraViewController(nibName: "ObraViewController", bundle: nil)
        obraDetailViewController.exposicion = obra
        
        self.navigationController?.pushViewController(obraDetailViewController, animated: true)
        
    }
    
    
}

//For Layout and Grid del Collection View
extension exposicionesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }

    func calculateWith() -> CGFloat{
        let estimateWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))

        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount

        return width
    }


}
