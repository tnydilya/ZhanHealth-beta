//
//  Contact.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
  @objc dynamic var name: String? = nil
  @objc dynamic var phone: String? = nil
  @objc dynamic var owner: User?
}
