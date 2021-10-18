//
//  CalendarViewController.swift
//  MARCO_App
//
//  Created by Ana Fernanda on 13/10/21.
//  Copyright © 2021 com.tec.tc2007b. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    var events : [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
    }
    
    func fetchData(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/events", method: .get, parameters: nil, stringParameters: nil) {(event: [Event]?, error) in
        if error != nil {
            print(error!)
        } else {
            guard let events = event else { return }
            self.events = events
            self.tableView.reloadData()
        }
    }
        
    }
    
    func formatDate(date: String?) -> String{
        return String((date?.split(separator: "T").first ?? ""));
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        formatDate(date: events[section].date)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        events.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events[section].events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.section].events[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "eventCell")
        cell.textLabel?.text = event
        return cell
    }


}
