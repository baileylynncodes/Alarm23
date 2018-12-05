//
//  SwitchTableViewCell.swift
//  Alarm23
//
//  Created by Karissa McDaris on 12/4/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}
class SwitchTableViewCell: UITableViewCell {
   
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        }

    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.switchCellSwitchValueChanged(cell: self)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews(){
        nameLabel.text = alarm?.name
        timeLabel.text = alarm?.fireDateAsString
        alarmSwitch.isOn = alarm?.enabled ?? false
    }

}

