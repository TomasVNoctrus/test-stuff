//
//  UserTransactionHistory.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-12-07.
//

import Foundation

class TransactionHistory {
    
    var userbalance: String
    let date: String
    let username: String
    
    init(userbalance: String, date: String, username: String) {
        self.userbalance = userbalance
        self.date = date
        self.username = username
    }
}
