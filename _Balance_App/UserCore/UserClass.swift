//
//  UserClass.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-12-05.
//

import Foundation

class User {
    var username: String
    var password: String
    var isOnline: Bool
    
    init(username: String, password: String, isOnline: Bool) {
        self.username = username
        self.password = password
        self.isOnline = isOnline
    }
}
