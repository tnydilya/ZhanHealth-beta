//
//  EmergencyView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class EmergencyView: UIView {
  
  lazy var title: UILabel = {
    let lbl = UILabel()
    lbl.text = "In case of emergency PRESS"
    lbl.numberOfLines = 0
    lbl.font = UIFont(name: Font.semiBold.rawValue, size: 18.widthProportion())
    lbl.textAlignment = .center
    return lbl
  }()
  
  lazy var sosButton: UIButton = {
    let but = UIButton()
    but.backgroundColor = AppColor.red
    but.layer.cornerRadius = 250.widthProportion()/2
    but.titleLabel?.font = UIFont(name: Font.semiBold.rawValue, size: 60.widthProportion())
    but.setTitle("SOS", for: .normal)
    but.layer.shadowColor = UIColor.gray.cgColor
    but.layer.shadowOffset = CGSize(width: 4, height: 4)
    but.layer.shadowRadius = 10
    but.layer.shadowOpacity = 0.5
    return but
  }()
  
  lazy var instructionLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = "How to help me?"
    lbl.font = UIFont(name: Font.medium.rawValue, size: 15.widthProportion())
    lbl.textAlignment = .center
    return lbl
  }()
  
  lazy var instructionsButton: UIButton = {
    let but = UIButton()
    but.backgroundColor = AppColor.blue
    but.layer.cornerRadius = 20
    but.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 15.widthProportion())
    but.setTitle("Show Instructions", for: .normal)
    return but
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = AppColor.gray
    setupViews()
    setupConstraints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [title, sosButton, instructionLabel, instructionsButton].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    sosButton.easy.layout(Center(0),
                          Size(250.widthProportion()))
    title.easy.layout(Bottom(20.heightProportion()).to(sosButton),
                      Width(250.widthProportion()),
                      CenterX(0))
    instructionsButton.easy.layout(Bottom(40.heightProportion()),
                                   CenterX(0),
                                   Width(250.widthProportion()),
                                   Height(35.heightProportion()))
    instructionLabel.easy.layout(Bottom(10.heightProportion()).to(instructionsButton),
                                 Width(250.widthProportion()),
                                 CenterX(0))
  }

}
