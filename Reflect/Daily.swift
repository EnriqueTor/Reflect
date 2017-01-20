//
//  Daily.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/18/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation
import Firebase

class Daily {
    
    var date: String
    
    init(date: String) {
        self.date = date
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as? [String : AnyObject]
        
        date = snapshotValue?["date"] as? String ?? "No date"
        
    }

}



