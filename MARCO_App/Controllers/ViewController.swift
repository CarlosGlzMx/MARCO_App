//
//  ViewController.swift
//  MARCO_App
//
//  Created by Carlos del Rosal on 24/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var marcoLogo: UIImageView!
    @IBOutlet weak var exposicionesBtn: UIButton!
    @IBOutlet weak var vistasBtn: UIButton!
    @IBOutlet weak var reservasBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func muestraUbi(_ sender: Any) {
        if let url = URL(string: "https://maps.google.com/?cid=13510301288881986484") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

