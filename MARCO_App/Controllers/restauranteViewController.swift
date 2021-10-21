//
//  restauranteViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 24/08/21.
//

import UIKit

class restauranteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reserva de Restaurantes"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reservaMesa(_ sender: Any) {
        displayAlert(title: "Funcionalidad pendiente", message: "Reservar una mesa en el restaurante aún no es posible")
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
