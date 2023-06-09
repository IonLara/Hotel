//
//  RegistrationTableViewController.swift
//  Hotel
//
//  Created by Ion Sebastian Rodriguez Lara on 09/05/23.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    var registrations : [Registration] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        let registration = registrations[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(registration.firstName) \(registration.lastName)"
        let checkInString = registration.checkInDate.formatted(date: .numeric, time: .omitted)
        let checkOutString = registration.checkOutDate.formatted(date: .numeric, time: .omitted)
        content.secondaryText = "\(checkInString) - \(checkOutString): \(registration.roomType.name)"
        cell.contentConfiguration = content
        return cell
    }
    
    @IBAction func unWindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController, let registration = addRegistrationTableViewController.registration else {return}
        registrations.append(registration)
        tableView.reloadData()
    }

}
