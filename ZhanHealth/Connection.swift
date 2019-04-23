//
//  Connection.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import Foundation
import RealmSwift

class Connection {
  
  fileprivate let realm = try! Realm()
  fileprivate let passwordKey = "userPassword"
  fileprivate let loginKey = "userLogin"
  
  func register(firstname: String, lastname: String, email: String, password: String) -> Bool {
    let foundUser = realm.objects(User.self).filter("email='\(email)' AND password='\(password)'").first
    if let _ = foundUser {
      return false
    }
    
    let user = User()
    user.firstname = firstname
    user.lastname = lastname
    user.email = email
    user.password = password
    try! realm.write {
      realm.add(user)
    }
    return true
  }
  
  func updateProfile(firstname: String, lastname: String, email: String, password: String) {
    let user = getAppUser()
    try! realm.write {
      user?.firstname = firstname
      user?.lastname = lastname
      user?.email = email
      user?.password = password
    }
  }
  
  func addOrUpdateMedCard(dob: String?, diseases: String?, bloodType: String?, rhesusFactor: String?) {
    if let medcard = getAppUser()?.medicalCard {
      try! realm.write {
        medcard.dob = dob
        medcard.diseases = diseases
        medcard.bloodType = bloodType
        medcard.rhesusFactor = rhesusFactor
      }
    } else {
      let card = MedicalCard()
      card.dob = dob
      card.diseases = diseases
      card.bloodType = bloodType
      card.rhesusFactor = rhesusFactor
      card.owner = getAppUser()
      try! realm.write {
        realm.add(card)
        getAppUser()?.setValue(card, forKey: "medicalCard")
      }
    }
  }
  
  func addInstruction(problem: String, solution: String) {
    if let user = getAppUser() {
      let ins = Instruction()
      ins.owner = user
      ins.problem = problem
      ins.solution = solution
      try! realm.write {
        realm.add(ins)
        getAppUser()?.instructions.append(ins)
      }
    }
  }
  
  func deleteInstruction(instruction: Instruction) {
    try! realm.write {
      realm.delete(instruction)
    }
  }
  
  func addContact(name: String, phone: String) {
    if let user = getAppUser() {
      let con = Contact()
      con.name = name
      con.phone = phone
      con.owner = user
      try! realm.write {
        realm.add(con)
        getAppUser()?.contacts.append(con)
      }
    }
  }
  
  func deleteContact(contact: Contact) {
    try! realm.write {
      realm.delete(contact)
    }
  }
  
  func isLoggedIn() -> Bool {
    if let _ = getAppUser() {
      return true
    }
    return false
  }
  
  func logIn(email: String, password: String) -> Bool {
    let user = realm.objects(User.self).filter("email='\(email)' AND password='\(password)'").first
    if let foundUser = user {
      let appUser = getAppUser()
      if appUser == nil || appUser != foundUser {
        saveAppUser(user: foundUser)
      }
      return true
    }
    return false
  }
  
  func logOut() {
    UserDefaults.standard.removeObject(forKey: loginKey)
    UserDefaults.standard.removeObject(forKey: passwordKey)
    UserDefaults.standard.synchronize()
  }
  
  func saveAppUser(user: User) {
    UserDefaults.standard.set(user.email!, forKey: loginKey)
    UserDefaults.standard.set(user.password!, forKey: passwordKey)
    UserDefaults.standard.synchronize()
  }
  
  func getAppUser() -> User? {
    if let login = UserDefaults.standard.value(forKey: loginKey),
      let password = UserDefaults.standard.value(forKey: passwordKey) {
      let user = realm.objects(User.self).filter("email='\(login)' AND password='\(password)'").first
      return user
    }
    return nil
  }
  
}
