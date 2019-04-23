//
//  Instruction.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import Foundation
import RealmSwift

class Instruction: Object {
  @objc dynamic var problem: String? = nil
  @objc dynamic var solution: String? = nil
  @objc dynamic var owner: User?
}
