//
//  ProfileHeaderView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileHeaderView: UIView {
  
  lazy var imageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "adult")
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  lazy var nameLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.medium.rawValue, size: 24.widthProportion())
    lbl.numberOfLines = 0
    return lbl
  }()
  
  lazy var buttonsStack: ProfileHeaderButtonsStack = {
    let bs = ProfileHeaderButtonsStack()
    return bs
  }()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    layer.cornerRadius = 10
    layer.shadowOffset = CGSize.zero
    layer.shadowOpacity = 0.1
    layer.shadowRadius = 4
    setupViews()
    setupConstraints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [imageView, nameLabel, buttonsStack].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    imageView.easy.layout(Top(20.heightProportion()),
                          Left(20.widthProportion()),
                          Size(70.widthProportion()))
    nameLabel.easy.layout(CenterY(0).to(imageView),
                          Left(20.widthProportion()).to(imageView),
                          Right(20.widthProportion()))
    buttonsStack.easy.layout(Bottom(10.heightProportion()),
                             CenterX(0),
                             Top(20.heightProportion()).to(imageView))
  }

}
