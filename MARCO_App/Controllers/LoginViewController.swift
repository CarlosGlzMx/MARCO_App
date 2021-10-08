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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLogin" {
            guard let NavigationController = segue.destination as?
                    NavigationController else {return}
            
        }
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
        
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            if error != nil {
                print(error!)
            }
            else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") 
                self.present(vc, animated: true, completion: nil)
                
            }
        }
    }
    

}
