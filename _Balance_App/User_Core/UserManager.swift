//
//  UserManager.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-11-29.
//
//importuoja pasirinktina koda, kurio reikes operacijoms
import Foundation

//userio tapatybes input output suspaustas objektas
struct UserResult {
    let user: User?           // userio data info
    let balance: UserBalance?     // userio balanco info
    let errorTitle: String?   // kazkur kitur grazina errorTiltle kintamaji
    let errorMessage: String? // kazkur kitur grazina errorMessage kintamaji
}

                              //Userio valdymo klase ir jos funkcijos
class UserManager {
                              //useriu arejus
    var userList: [User] = []
   
    
    
    //registravimo modulis
    func register(username: String, password: String, repeatPassword: String) -> UserResult {
        let registerErrorTitle = "Error creating user"
        
        
        //ar tusti langai
        guard !username.isEmpty, !password.isEmpty, !repeatPassword.isEmpty
        else {
            return UserResult(user: nil, balance: nil, errorTitle: registerErrorTitle, errorMessage: "User name and password cannot be empty")
        }
        //ar slaptazodis yra tikrai toks koks suvestas
        if password != repeatPassword {
            return UserResult(user: nil, balance: nil, errorTitle: registerErrorTitle, errorMessage: "Passwords do not match")
        }
        //ar vartotojas jau egzistuoja
        for user in userList {
            if username == user.username {
                return UserResult(user: nil, balance: nil, errorTitle: registerErrorTitle, errorMessage: "User already exists")
            }
        }
        
        //jei praeina iki cia - visus userio duomenis priskiria vienai konstantai ir uzregistruoja usery
        let user = User(username: username, password: password, isOnline: true)
        //uzregistruoja usesi
        userList.append(user)
        
        
        
        //po patikros ir registracijos grazina sio userio rezultata i bendro tipo nocification, loginregview kontroleris siuos duomenis jau siuncia i asmeniny userio langa
        return UserResult(user: user, balance: nil, errorTitle: nil, errorMessage: nil)
    }
    
    
    
    //logino modulis
    func login(username: String, password: String) -> UserResult {
        let loginErrorTitle = "Error logging in"
        let userOptional = userList.first(where: { $0.username == username }) //$0 closure parametras "where: { $0.username == username }"
        
        
        //ar tusti langai
        guard !username.isEmpty, !password.isEmpty
        else {
            return UserResult(user: nil, balance: nil, errorTitle: loginErrorTitle, errorMessage: "User name and password cannot be empty")
        }
        
        //patikrina ar toks useris egzistuoja ir jei egzistuoja - patikrina ar slaptazodis sutampa
        guard let user = userOptional else {
            return UserResult(user: nil, balance: nil, errorTitle: loginErrorTitle, errorMessage: "User with given username not found")
        }
            
        //patikrina ar userio slaptazodis tinka
        if password != user.password {
            return UserResult(user: nil, balance: nil, errorTitle: loginErrorTitle, errorMessage: "Entered password is wrong")
        }
        
        //po patikros jei useris randamas, grazina userio rezultata i bendro tipo nocification, nusiuncia i asmeniny langa
        return UserResult(user: user, balance: nil, errorTitle: nil, errorMessage: nil)
    }  
    
    
    func createUserBalance() {
        
        //  iraso pradiny userio balance
        //  let userbalance = UserBalance(userbalance: String, date: String, username: String)
        //  userbalance.append(userbalance)
        //  (userbalance: String, date: String, username: String) -> UserBalanceResult
    }
    
    
    func addTransactionToHistory() {
        
    }
    
    func addBalance() {
        
    }
    
    func makeTransaction() {
        
    }
    
    
}
