//
//  LinkTextView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class LinkTextView: UITextView {
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    self.isEditable = false
    self.isScrollEnabled = false
    let linkAttributes: [NSMutableAttributedString.Key : Any] = [.foregroundColor: AppColor.blue]
    self.font = UIFont(name: Font.medium.rawValue, size: 11.widthProportion())
    self.linkTextAttributes = linkAttributes
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
