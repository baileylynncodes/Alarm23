//
//  AlarmController.swift
//  Alarm23
//
//  Created by Karissa McDaris on 12/4/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

import Foundation

class AlarmController {
    
    static let sharedInstance = AlarmController()
    var alarmsArray: [Alarm] = []
    func addAlarmWith(fireDate: Date, name: String, enabled: Bool){
        let alarm = Alarm(name: name, fireDate: fireDate, enabled: enabled)
        alarmsArray.append(alarm)
    }
    
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
    }
    
    func delete(alarm: Alarm) {
        if let index = alarmsArray.index(of: alarm) {
            alarmsArray.remove(at: index)
        }
    }
    
    func toggleEnabled(for alarm: Alarm) {
        if alarm.enabled == true {
            alarm.enabled = false
        } else {
            alarm.enabled = true
        }
    }
}
extension AlarmController {
    private static func fileUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "playlists.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        return fullURL
    }
    
    private func saveToPersistanceStorage(){
        //encode source of truth into data
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(alarmsArray)
            
            //write that data to proper location on phone
            try data.write(to: AlarmController.fileUrl())
        } catch {
            print("there was an error in \(#function) \(error) : \(error.localizedDescription)")
        }
    }
}


