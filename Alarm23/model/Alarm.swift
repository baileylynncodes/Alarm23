//
//  Alarm.swift
//  Alarm23
//
//  Created by Karissa McDaris on 12/4/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import Foundation


class Alarm {
    var fireDate: Date
    var name: String
    var enabled: Bool
    let uuid: String
    var fireDateAsString: String {
        return DateFormatter.localizedString(from: fireDate, dateStyle: .medium, timeStyle: .short)
        
    }
    
    init(name: String, fireDate: Date, enabled: Bool, uuid: String = UUID().uuidString) {
        self.name = name
        self.uuid = uuid
        self.enabled = enabled
        self.fireDate = fireDate
    }

}

extension Alarm : Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        if lhs.fireDate == rhs.fireDate &&
         lhs.name == rhs.name &&
         lhs.enabled == rhs.enabled &&
            lhs.uuid == rhs.uuid {
            return true
        } else {
            return false
        }
    }
}
