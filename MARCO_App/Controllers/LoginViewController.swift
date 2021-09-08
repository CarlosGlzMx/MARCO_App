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
            return
        }
        
        guard let password = passwordField.text else {
            print("Error en contraseña")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
            if error != nil {
                print(error!)
            }
            else {
                print("Usuario registrado \(authResult?.user.uid ?? "")")
            }
        }
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
