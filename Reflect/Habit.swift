//
//  Habit.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation
import Firebase

struct Habit {
    
    var id: String
    var name: String
    var startDate: String
    var archive: String
    
    init(id: String, name: String, startDate: String, archive: String) {
        
        self.id = id
        self.name = name
        self.startDate = startDate
        self.archive = archive
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String : AnyObject]
        
        id = snapshotValue["id"] as! String
        name = snapshotValue["name"] as! String
        startDate = snapshotValue["startDate"] as! String
        archive = snapshotValue["archive"] as! String
        
    }

    func serialize() -> [String:Any] {
        return  ["id" : id, "name": name, "startDate": startDate, "archive": archive]
        
    }

    
    
}
