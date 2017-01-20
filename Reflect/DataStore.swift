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
    var rankHabit: String = RankHabit.select.rawValue
    var currentDate: String = ""
    var yesterdayDate: String = ""
    var habits: [Habit] = []
    var todayHabits: [Habit] = []
    var yesterdayHabits: [Habit] = []
    var habitSelected = ""



}

enum RankHabit: String {
    
    case select = "selected"
    case pick = "pick"
    
}
