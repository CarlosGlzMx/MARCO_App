//
//  ObraViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 07/09/21.
//

import UIKit

class ObraViewController: UIViewController {

    @IBOutlet weak var obraImage: UIImageView!
    
    @IBOutlet weak var obraDate: UILabel!
    @IBOutlet weak var obraTitle: UILabel!
    @IBOutlet weak var obraDescription: UITextView!
    
    
    var exposiciones : Exposicion?
    override func viewDidLoad() {
        super.viewDidLoad()

    guard let obra = exposiciones else {return}
        
        let urlRecorrido = URL(string: obra.recorridoVirtual)!
        obraDate.text = obra.startDate
        obraTitle.text = obra.title
        //obraDescription.text = obra.description
        
    }
 
    /*
    @IBAction func muestraUbi(_ sender: Any) {
        if let url = URL(string: "https://maps.google.com/?cid=13510301288881986484") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }*/
    
    @IBAction func recorridoBtn(_ sender: Any) {
        if let url = 
    }
    
    

}
