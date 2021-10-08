//
//  RecorridoViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 06/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit
import WebKit

class RecorridoViewController: UIViewController {

    @IBOutlet weak var recorridoWebView: WKWebView!
    var recorridoUrl : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let recorrido = recorridoUrl, !recorrido.isEmpty else {return}
        guard let url = URL(string: recorrido) else {return}
        
        recorridoWebView.load(URLRequest(url: url))
    }


   

}
