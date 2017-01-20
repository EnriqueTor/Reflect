//
//  User.swift
//  Reflect
//
//  Created by Enrique Torrendell on 1/13/17.
//  Copyright © 2017 Enrique Torrendell. All rights reserved.
//

import Foundation

class User {
  
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
    
    func serialize() -> [String : Any] {
        return  ["id" : id, "name" : name, "email": email, "interested" : interested, "premium" : premium]
    }

    func deserialize(_ data: [String : String]) -> User {
    
        let id = data["id"] ?? ""
        let name = data["name"] ?? ""
        let email = data["email"] ?? ""
        let interested = data["interested"] ?? ""
        let premium = data["premium"] ?? ""
        
        return User(id: id, name: name, email: email, interested: interested, premium: premium)
    
    }
    
}
