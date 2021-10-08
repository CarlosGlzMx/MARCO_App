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
            print("Error de email")
            return
        }
        
        guard let password = pwdField.text else {
            print("Error en contraseña")
            return
        }
        
        guard let password2 = pwdConfirmField.text else {
            print("Error de email")
            return
        }
        
        if password != password2 {
            print("Contraseñas no coinciden")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
            if error != nil {
                print(error!)
            }
            else {
                print("Correcto registro de usuario \(authResult?.user.uid ?? "")")
                
                
                self.performSegue(withIdentifier: "segueSignUp", sender: nil)
                
            }
        }
    }
}
