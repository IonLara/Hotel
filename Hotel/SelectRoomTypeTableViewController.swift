//
//  SelectRoomTypeTableViewController.swift
//  Hotel
//
//  Created by Ion Sebastian Rodriguez Lara on 08/05/23.
//

import UIKit

class SelectRoomTypeTableViewController: UITableViewController {
    weak var delegate: SelectRoomTypeTableViewControllerDelegate?
    var roomType: RoomType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        roomType = RoomType.all[indexPath.row]
        delegate?.selectRoomTypeTableViewController(self, didSelect: roomType!)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RoomType.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        let roomType = RoomType.all[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = roomType.name
        content.secondaryText = "$ \(roomType.price)"
        cell.contentConfiguration = content
        cell.accessoryType = roomType == self.roomType ? .checkmark : .none
        return cell
    }
}

protocol SelectRoomTypeTableViewControllerDelegate: AnyObject {
    func selectRoomTypeTableViewController(_ controller :SelectRoomTypeTableViewController, didSelect:RoomType)
}
