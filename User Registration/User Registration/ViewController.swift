//
//  ViewController.swift
//  User Registration
//
//  Created by iOSLab on 04/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateNasc: UITextField!
    @IBOutlet weak var irelandName: UITextField!
    @IBOutlet weak var genderInput: UISegmentedControl!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var nameOutput: UITextView!
    @IBOutlet weak var delete: UITextField!
    // INSTANCIA DE uma UserMananger de vir de outra classe
    let manager = UsersManager()
    
    private func renderResult (names: String) {
        nameOutput.text = names
    }

   
    private func renderError(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func addButton(_ sender: Any) {
        guard let name = nameInput.text,
              let date = dateNasc.text,
              let gender = Gender(rawValue: genderInput.selectedSegmentIndex),
              let pais = irelandName.text,
              !name.isEmpty
        else {
            renderError(message: "Ocorreu um erro, tente novamente.")
            return
        }
        let user = User(name: name, gender: gender, irelandName: pais, dateNasc: date)
        manager.addUser(user: user)
        
        guard let userResult = manager.getUsers() else {
            renderError(message: "Data errada")
        return
        }
         renderResult(names:userResult)
    }
    
    
    @IBAction func removerUser(_ sender: Any) {
        guard let delete = delete.text,
              !delete.isEmpty else {
            renderError(message: "Digite um nome correto para remover o usuário")
            return
        }
        let isDeleted = manager.deleteUser(name: delete)
        guard let userResult = manager.getUsers(),
              isDeleted else {
            renderError(message: "Usuário não encontado")
            return
        }
        renderResult(names: userResult)
    }
    
}

