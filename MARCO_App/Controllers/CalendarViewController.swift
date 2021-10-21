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
        cell.backgroundColor = UIColor(red: 244 / 255, green: 237 / 255, blue: 231 / 255, alpha: 1)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.contentMode = .scaleToFill
        cell.textLabel?.text = event
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 255 / 255, green: 190 / 255, blue: 8 / 255, alpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.black
    }


}
