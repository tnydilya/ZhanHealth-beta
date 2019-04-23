//
//  User.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
  @objc dynamic var firstname: String? = nil
  @objc dynamic var lastname: String? = nil
  @objc dynamic var email: String? = nil
  @objc dynamic var password: String? = nil
  @objc dynamic var medicalCard: MedicalCard?
  let contacts = List<Contact>()
  let instructions = List<Instruction>()
}
