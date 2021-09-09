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
    
    @IBAction func muestraWebsite(_ sender: Any) {
        if let url = URL(string: "https://marco.org.mx/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func muestraUbi(_ sender: Any) {
        if let url = URL(string: "https://maps.google.com/?cid=13510301288881986484") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}



