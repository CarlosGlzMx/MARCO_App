//
//  ReservacionViewController.swift
//  MARCO_App
//
//  Created by user195584 on 9/8/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit
import FirebaseAuth

class ReservacionViewController: UIViewController {
  
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sizeField: UITextField!
    
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet weak var guidePicker: UIPickerView!
    
    var visitas: [Visita] = []
    var uniqueDays: [String] = []
    var days: [String] = []
    
    var selectedDate: String = ""
    var selectedGuide: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Agendar Visitas"
        
        emailField.text = Auth.auth().currentUser?.email
        emailField.isEnabled = false
        
        
        datePicker.dataSource = self
        datePicker.delegate = self
        guidePicker.dataSource = self
        guidePicker.delegate = self
        
        fetch()
    }
    
    func fetch(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/visits", method:.get , parameters: nil, stringParameters: nil) {
            (event: [Visita]?, error) in
            if error != nil
            {
                print(error ?? "Hubo un error misterioso")
                
            }
            else{
                guard let visitas = event else {return}
                self.visitas = visitas
                for i in 0...self.visitas.count - 1 {
                    self.visitas[i].day = String((self.visitas[i].date?.split(separator: "T").first ?? ""));
                }
                self.uniqueDays = Array(Set(self.visitas.map {
                    visita in
                    return visita.day ?? ""
                }))
                
                self.days = self.horasParaFecha(fecha: self.visitas[0].day ?? "").map { visita in
                    visita.guide ?? ""
                }
                self.datePicker.reloadAllComponents()
                self.guidePicker.reloadAllComponents()
                
                self.selectedDate = self.uniqueDays[0]
                self.selectedGuide = self.days[0]
                
            }
        }
        
    }
    
    @IBAction func reserveVisit(_ sender: Any) {
        guard let email = emailField.text else {
            displayAlert(title: "Error", message: "El email no es válido")
            return
        }
        
        guard let size = sizeField.text else {
            displayAlert(title: "Error", message: "El tamaño no es válido")
            return
        }
        
        if !size.isInt || Int(size) ?? 0 < 1 {
                displayAlert(title: "Error", message: "Elige un número de invitados válido")
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let visitId = self.visitas.filter {
            visita in
            return visita.guide ?? "" == selectedGuide && visita.day ?? "" == selectedDate
        }[0].id ?? ""
        
        let Url = String(format: "https://pacific-inlet-83178.herokuapp.com/reserve")
            guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["userId" : userId, "userEmail" : email, "visitId" : visitId, "persons" : size as String]
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
                return
            }
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
//                    HTTPURLResponse(coder: response.status)
                    DispatchQueue.main.async {
                        self.displayAlert(title: "Visita Agendada", message: "¡Tu Visita ha sido agendada exitosamente! 😁")
                    }
                    print("Hubo una respuesta")
                }
            }.resume()
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

extension ReservacionViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return uniqueDays.count
        }
        else {
            return days.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return uniqueDays[row]
        }
        else {
            guard let fecha = visitas[datePicker.selectedRow(inComponent: 0)].day else { return "" }
            return horasParaFecha(fecha: fecha)[row].guide
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            days = horasParaFecha(fecha: visitas[row].day ?? "").map { visita in
                visita.day ?? ""
            }
            selectedDate = uniqueDays[row]
            guidePicker.reloadAllComponents()
        }
        else {
            selectedGuide = days[row]
        }
    }
    
    func horasParaFecha(fecha: String) -> [Visita] {
        return visitas.filter { visita in
            return visita.day == fecha
        }
    }
}

extension ReservacionViewController: UIPickerViewDelegate{
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
