//
//  DataStore.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/13/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation

class DataStore{
    
    private init(){}
    
    static let sharedInstance = DataStore()

    var user = User(id: "", name: "", email: "", interested: "", premium: "")
//    var habit = Habit(id: "", name: "", archive: "", date: "")
    var rankHabit: String = RankHabit.select.rawValue
    var currentDate: String = ""
    var yesterdayDate: String = ""
    var userHabits: [Habit] = []
    var habitSelected = ""



}

enum RankHabit: String {
    
    case select = "selected"
    case pick = "pick"
    
}
