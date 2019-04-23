//
//  Constants.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

struct AppColor {
  static let blue =  UIColor(red: 36/255.0, green: 175/255.0, blue: 237/255.0, alpha: 1)
  static let green = UIColor(red: 50/255.0, green: 183/255.0, blue: 128/255.0, alpha: 1)
  static let gray = UIColor(red: 242/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1)
  static let red = UIColor(red: 253/255.0, green: 126/255.0, blue: 119/255.0, alpha: 1)
}

struct Screen  {
  static var width = UIScreen.main.bounds.size.width
  static var height = UIScreen.main.bounds.size.height
  static var widthProportion = width/375
  static var heightProportion = height/667
}

enum Font: String {
  case regular = "Poppins"
  case medium = "Poppins-Medium"
  case semiBold = "Poppins-SemiBold"
}
