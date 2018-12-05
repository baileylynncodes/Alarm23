//
//  AlarmListTableViewController.swift
//  Alarm23
//
//  Created by Karissa McDaris on 12/4/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController, SwitchTableViewCellDelegate {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else {return}
        let alarm = AlarmController.sharedInstance.alarmsArray[index.row]
        AlarmController.sharedInstance.toggleEnabled(for: alarm)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.sharedInstance.alarmsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SwitchTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! SwitchTableViewCell

        // Configure the cell...
        let alarm = AlarmController.sharedInstance.alarmsArray[indexPath.row]
        cell.alarm = alarm

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AlarmController.sharedInstance.alarmsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            guard let index = tableView.indexPathForSelectedRow else {return}
            let destinationVC = segue.destination as? AlarmDetailTableViewController
            let alarm = AlarmController.sharedInstance.alarmsArray[index.row]
            destinationVC?.alarm = alarm
        }
    }
}
