//
//  User.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/13/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation

struct User {
  
    var id: String
    var name: String
    var email: String
    var interested: String
    var premium: String
    
    init(id: String, name: String, email: String, interested: String, premium: String) {
        
        self.id = id
        self.name = name
        self.email = email
        self.interested = interested
        self.premium = premium
        
    }
    
}
