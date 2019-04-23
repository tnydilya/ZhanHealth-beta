//
//  MedicalCard.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import Foundation
import RealmSwift

class MedicalCard: Object {
  @objc dynamic var dob: String? = nil
  @objc dynamic var diseases: String? = nil
  @objc dynamic var bloodType: String? = nil
  @objc dynamic var rhesusFactor: String? = nil
  @objc dynamic var owner: User?
}
