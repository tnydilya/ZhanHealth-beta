//
//  ProfileHeaderButton.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class ProfileHeaderButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.titleLabel?.font = UIFont(name: Font.regular.rawValue, size: 13.widthProportion())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let spacing: CGFloat = 6.0
    
    let imageSize = self.imageView!.frame.size
    
    self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
    
    let titleSize = self.titleLabel!.frame.size
    
    self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
  }
  
}
