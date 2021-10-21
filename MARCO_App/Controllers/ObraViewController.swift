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
    
    @IBOutlet weak var lblCuraduria: UILabel!
    @IBOutlet weak var lblMuseografia: UILabel!
    @IBOutlet weak var lblSalas: UILabel!
    @IBOutlet weak var lblTecnica: UILabel!
    @IBOutlet weak var lblObras: UILabel!
    
    var exposicion : Exposicion?
    override func viewDidLoad() {
        super.viewDidLoad()

    guard let obra = exposicion else {return}
        
//        let urlRecorrido = URL(string: obra.recorridoVirtual)!
        obraDate.text = formatDate(date: obra.startDate)
        obraTitle.text = obra.title
        obraDescription.text = obra.description
        
        lblCuraduria.text = "CURADURÍA: " + obra.cerraduria!
        lblMuseografia.text = "MUSEOGRAFÍA: " + obra.museografia!
        lblSalas.text = "SALAS: " + obra.salas!
        lblTecnica.text = "TÉCNICA: " + obra.tecnica!
        lblObras.text = "OBRAS: " + obra.obras!
        
//        let url = URL(string: obra.photoUrl)!
//        obraImage.downloaded(from: url)
        
    }
    
    func formatDate(date: String?) -> String{
        return String((date?.split(separator: "T").first ?? ""));
    }
 
    
    @IBAction func recorridoBtn(_ sender: Any) {
//        if let url =
        let viewController = RecorridoViewController(nibName: "RecorridoViewController", bundle: nil)
        viewController.recorridoUrl = exposicion?.recorridoVirtual
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func videoBtn(_ sender: Any) {
        let viewController = RecorridoViewController(nibName: "RecorridoViewController", bundle: nil)
        viewController.recorridoUrl = exposicion?.videoUrl
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    

}

