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
    var archive: String
    var date: [String:String]
    
    init(id: String, name: String, archive: String, date: [String:String]) {
        
        self.id = id
        self.name = name
        self.archive = archive
        self.date = date
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as? [String : Any]
        
        id = snapshotValue?["id"] as? String ?? "No id"
        name = snapshotValue?["name"] as? String ?? "No name"
        archive = snapshotValue?["archive"] as? String ?? "No archive"
        date = (snapshotValue?["date"] as? [String : String]) ?? ["No date":"No date"]
        
    }

    func serialize() -> [String:Any] {
        return  ["id" : id, "name": name, "archive": archive, "date": date]
        
    }

    
    
}
