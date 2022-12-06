//
//  UserBalance.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-12-05.
//

import Foundation

class Balance {
    var balance: Double
    let date: Date
    let username: String
    
    init(balance: Double, date: Date, username: String) {
        self.balance = balance
        self.date = date
        self.username = username
    }
}
