//
//  UserMananger.swift
//  User Registration
//
//  Created by iOSLab on 18/05/24.
//
//
//import Foundation

class UsersManager{
    
    var users: [User] = []
    
    func addUser(user: User){
        users.append(user)
    }
    
    func deleteUser(name: String) -> Bool {
        guard let userIndex =  users.firstIndex(where: {$0.name == name})else{
            return false
        }
        users.remove(at: userIndex)
        return true
    }
    
    
    
    func getUsers() -> String? {
        var result: String = ""
        for (index,user) in users.enumerated() {
            guard let age = user.age else {
                //users.remove(at: index)
                return nil
            }
            result += "\(index + 1). \(user.name) é \(user.gender.getName()) nascido no \(user.irelandName) e tem \(age) anos\n"
        }
    return result
    }
}
