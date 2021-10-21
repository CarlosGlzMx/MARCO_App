//
//  LoginViewController.swift
//  MARCO_App
//
//  Created by Ana Fernanda on 07/09/21.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func loggedIn(_ sender: Any) {
        guard let email = emailField.text else {
            print("Error de email")
            displayAlert(title: "Error", message: "El email no es válido")
            return
        }

        guard let password = passwordField.text else {
            print("Error en contraseña")
            displayAlert(title: "Error", message: "El password no es válido")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            if error != nil {
                self.displayAlert(title: "Error", message: "Ingrese datos correctos")
            }
            else {
                self.performSegue(withIdentifier: "segueLogin", sender: nil)

            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    

}
