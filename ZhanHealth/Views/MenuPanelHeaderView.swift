//
//  MenuPanelHeaderView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class MenuPanelHeaderView: UIView {
  
  lazy var avatar: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "adult")
    iv.layer.cornerRadius = 5
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  lazy var nameLabel: UILabel = {
    let l = UILabel()
    l.font = UIFont(name: Font.medium.rawValue, size: 14.widthProportion())
    l.numberOfLines = 0
    return l
  }()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupViews()
    setupConstraints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [avatar, nameLabel].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    avatar.easy.layout(Left(10.widthProportion()),
                       Top(5.heightProportion()),
                       Bottom(5.heightProportion()),
                       Width(75.widthProportion()))
    nameLabel.easy.layout(CenterY(0).to(avatar),
                          Left(10.widthProportion()).to(avatar),
                          Right(5.widthProportion()))
  }
}
