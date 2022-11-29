//
//  UserClass.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-11-29.
//

import Foundation

class User {
    var username: String
    var password: String
    var balance: Double
    
    init(username: String, password: String, balance: Double) {
        self.username = username
        self.password = password
        self.balance = balance
    }
}
