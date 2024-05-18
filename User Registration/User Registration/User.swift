//
//  User.swift
//  User Registration
//
//  Created by iOSLab on 11/05/24.
//

import Foundation

enum Gender: Int {
    case masculine
    case feminine
    
    func getName() -> String{
        switch self {
        case .masculine:
            return "Masculino"
        case .feminine:
            return "Feminino"
            
        }
        
    }
    
}

struct User {
    
    let name: String
    let gender: Gender
    let irelandName: String
    let dateNasc: String
    
    
    // Split é usado para separar como array os dados informados pelo cliente
    // O que fizemos criamos um guard let para armanezar apenas o ano e fizemos uma calculo do ano atual menos o ano do aniversário da pessoa para apresentar a idade corretamente.
    
    var age: Int? {
    guard let ano =
        Int (dateNasc.split(separator: "/").last ?? "")
        else {
        return nil
    }
        return Calendar.current.component(.year, from: Date()) - ano
    }
}
