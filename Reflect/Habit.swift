//
//  Habit.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation
import Firebase

class Habit {
    
    var id: String
    var name: String
    var startDate: String
    var endDate: String
    var archive: String
    var date: [String:String]
    
    init(id: String, name: String, startDate: String, endDate: String, archive: String, date: [String:String]) {
        
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.archive = archive
        self.date = date
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as? [String : Any]
        
        id = snapshotValue?["id"] as? String ?? "No id"
        name = snapshotValue?["name"] as? String ?? "No name"
        archive = snapshotValue?["archive"] as? String ?? "No archive"
        startDate = snapshotValue?["startDate"] as? String ?? "No start date"
        endDate = snapshotValue?["endDate"] as? String ?? "No end date"
        date = (snapshotValue?["date"] as? [String : String]) ?? ["No date":"No date"]
        
    }

    func serialize() -> [String:Any] {
        return  ["id" : id, "name": name, "startDate": startDate, "endDate": endDate, "archive": archive, "date": date]
        
    }

    
    
}
