//
//  AlarmDetailTableViewController.swift
//  Alarm23
//
//  Created by Karissa McDaris on 12/4/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    var alarm: Alarm? {
        didSet{
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    var alarmIsOn: Bool = true
    
    
    private func updateViews() {
        alarmNameTextField.text = alarm?.name
        datePicker.date = alarm?.fireDate ?? Date()
        
        //MARK: - this fucker could be wrong :)
        alarmEnabledDisabled.titleLabel?.isEnabled = alarm?.enabled ?? true
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmNameTextField: UITextField!
    @IBOutlet weak var alarmEnabledDisabled: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    @IBAction func enabledButtonTapped(_ sender: Any) {
        guard let alarm = alarm else {return}
        AlarmController.sharedInstance.toggleEnabled(for: alarm)
        if alarm.enabled == false {
            alarmEnabledDisabled.setTitle("turn off", for: .normal)
        } else {
            alarmEnabledDisabled.setTitle("turn on", for: .normal)        }
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard alarmNameTextField.text != "",
            let alarmName = alarmNameTextField.text,
            let alarmDate = datePicker?.date else {return}
        if let saveAlarm = alarm {
            AlarmController.sharedInstance.update(alarm: saveAlarm, fireDate: alarmDate, name: alarmName, enabled: true)
        } else {
            AlarmController.sharedInstance.addAlarmWith(fireDate: alarmDate, name: alarmName, enabled: true)
        }
        navigationController?.popViewController(animated: true)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
