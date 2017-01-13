//
//  Habit.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/12/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation

struct Habit {
    
    var id: String
    var name: String
    var startingDate: String
    var finishDate: String
    var archive: String
    
    init(id: String, name: String, startingTime: String, finishDate: String, archive: String) {
        
        self.id = id
        self.name = name
        self.startingDate = startingTime
        self.finishDate = finishDate
        self.archive = archive
        
    }
    
    
    
    
}
