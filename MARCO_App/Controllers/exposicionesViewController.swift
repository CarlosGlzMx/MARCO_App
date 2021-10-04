//
//  exposicionesViewController.swift
//  MARCO_App
//
//  Created by Alexia Fernanda Saucedo Romero on 24/08/21.
//

import UIKit

class exposicionesViewController: UIViewController {

    var exposiciones: [Exposicion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Exposiciones"
        
        
        fetch()
        // Do any additional setup after loading the view.
    }
    
    func fetch(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/expositions", method:.get , parameters: nil, stringParameters: nil) {
            (event: [Exposicion]?, error) in
            if error != nil
            {
                print(error ?? "Hubo un error misterioso")
                
            }
            else{
                guard let exposiciones = event else {return}
                self.exposiciones = exposiciones
                print(exposiciones)
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
