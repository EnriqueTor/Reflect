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

    var user = User(id: "", name: "", email: "")

    var rankHabit: String = RankHabit.select.rawValue
    
    






}

enum RankHabit: String {
    
    case select = "selected"
    case pick = "pick"
    
}
