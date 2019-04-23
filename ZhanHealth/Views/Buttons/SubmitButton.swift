//
//  SubmitButton.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class SubmitButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 12.widthProportion())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.setGradientBackground()
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 5
  }

}

