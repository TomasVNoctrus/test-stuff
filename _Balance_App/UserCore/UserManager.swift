//
//  UserManager.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-11-29.
//
//importuoja pasirinktina koda, kurio reikes operacijoms
import Foundation

//userio input output suspaustas objektas
struct UserResult {
    let user: User?                 //kartu pasiima objekto kopija, bet ir grazina nauja info i sy objekta
    let errorTitle: String?
    let errorMessage: String?
}

class UserManager {
    //useriu arejus
    var userList: [User] = []
    
    //registravimo modulis
    func register(username: String, password: String, confirmPassword: String) -> UserResult {
        let registerErrorTitle = "Error creating user"
        
        
        //ar tusti langai
        guard !username.isEmpty, !password.isEmpty
        else {
            return UserResult(user: nil, errorTitle: registerErrorTitle, errorMessage: "User name and password cannot be empty")
        }
        //ar slaptazodis yra tikrai toks koks suvestas
        if password != confirmPassword {
            return UserResult(user: nil, errorTitle: registerErrorTitle, errorMessage: "Passwords do not match")
        }
        //ar vartotojas jau egzistuoja
        for user in userList {
            if username == user.username {
                return UserResult(user: nil, errorTitle: registerErrorTitle, errorMessage: "User already exists")
            }
        }
        
        //iraso vartotoja i areju su default parametrais
        let user = User(username: username, password: password, isOnline: true)
        userList.append(user)
        
        //po patikros uzregistruoja usesi ir grazina sio userio rezultata i bendro tipo nocification, nusiuncia i asmeniny langa
        return UserResult(user: user, errorTitle: nil, errorMessage: nil)
    }
    
    
    
    //logino modulis
    func login(username: String, password: String) -> UserResult {
        let loginErrorTitle = "Error logging in"
        let userOptional = userList.first(where: { $0.username == username }) //$0 closure parametras "where: { $0.username == username }"
        
        
        //ar tusti langai
        guard !username.isEmpty, !password.isEmpty
        else {
            return UserResult(user: nil, errorTitle: loginErrorTitle, errorMessage: "User name and password cannot be empty")
        }
        
        //patikrina ar toks useris egzistuoja ir jei egzistuoja - patikrina ar slaptazodis sutampa
        guard let user = userOptional else {
            return UserResult(user: nil, errorTitle: loginErrorTitle, errorMessage: "User with given username not found")
        }
            
        //patikrina ar userio slaptazodis tinka
        if password != user.password {
            return UserResult(user: nil, errorTitle: loginErrorTitle, errorMessage: "Entered password is wrong")
        }
        
        //po patikros jei useris randamas, grazina userio rezultata i bendro tipo nocification, nusiuncia i asmeniny langa
        return UserResult(user: user, errorTitle: nil, errorMessage: nil)
    }
    
    
    
}
