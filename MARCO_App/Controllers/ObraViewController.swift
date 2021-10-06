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
        
        obraDate.text = obra.startDate
        obraTitle.text = obra.title
        //obraDescription.text = obra.description
        
    }


    

}
