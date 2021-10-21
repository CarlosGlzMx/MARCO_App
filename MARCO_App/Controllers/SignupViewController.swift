//
//  SignupViewController.swift
//  MARCO_App
//
//  Created by Carlos del Rosal on 29/09/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var pwdConfirmField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        guard let email = emailField.text else {
            displayAlert(title: "Error", message: "Verifique los datos ingresados")
            return
        }
        
        guard let password = pwdField.text else {
            displayAlert(title: "Error", message: "Verifique los datos ingresados")
            return
        }
        
        guard let password2 = pwdConfirmField.text else {
            displayAlert(title: "Error", message: "Verifique los datos ingresados")
            return
        }
        
        if password != password2 {
            displayAlert(title: "Error", message: "Las contraseñas no coinciden")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
            if error != nil {
                self.displayAlert(title: "Error", message: "Utiliza un correo y contraseña válidos (8+ caracteres)")
                return
            }
            else {
                self.performSegue(withIdentifier: "segueSignUp", sender: nil)
                
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
