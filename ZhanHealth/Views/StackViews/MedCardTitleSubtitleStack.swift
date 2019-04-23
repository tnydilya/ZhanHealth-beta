//
//  MedCardTitleSubtitleStack.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class MedCardTitleSubtitleStack: UIStackView {
  
  lazy var titleLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.regular.rawValue, size: 14)
    return lbl
  }()
  
  lazy var subtitleLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.regular.rawValue, size: 14)
    lbl.numberOfLines = 0
    return lbl
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.axis = .horizontal
    self.distribution = .equalSpacing
    self.alignment = .leading
    setupViews()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [titleLabel, subtitleLabel].forEach {
      self.addArrangedSubview($0)
    }
  }

}
