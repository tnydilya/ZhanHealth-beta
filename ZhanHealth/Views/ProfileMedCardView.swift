//
//  ProfileMedCardView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileMedCardView: UIView {
  
  lazy var titleLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.medium.rawValue, size: 16)
    lbl.text = "Medical Card"
    return lbl
  }()
  
  lazy var dobStack: MedCardTitleSubtitleStack = {
    let st = MedCardTitleSubtitleStack()
    st.titleLabel.text = "Date of birth"
    return st
  }()
  
  lazy var chronicleStack: MedCardTitleSubtitleStack = {
    let st = MedCardTitleSubtitleStack()
    st.titleLabel.text = "Chronicle diseases"
    return st
  }()
  
  lazy var bloodTypeStack: MedCardTitleSubtitleStack = {
    let st = MedCardTitleSubtitleStack()
    st.titleLabel.text = "Blood type"
    return st
  }()
  
  lazy var rhesusStack: MedCardTitleSubtitleStack = {
    let st = MedCardTitleSubtitleStack()
    st.titleLabel.text = "Rhesus factor"
    return st
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
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
  
  func setData(user: User) {
    if let medCard = user.medicalCard {
      dobStack.subtitleLabel.text = medCard.dob
      chronicleStack.subtitleLabel.text = medCard.diseases
      bloodTypeStack.subtitleLabel.text = medCard.bloodType
      rhesusStack.subtitleLabel.text = medCard.rhesusFactor
    }
  }
  
  fileprivate func setupViews(){
    [titleLabel, dobStack, chronicleStack, bloodTypeStack, rhesusStack].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    titleLabel.easy.layout(Top(20.heightProportion()),
                           CenterX(0))
    dobStack.easy.layout(Top(30.heightProportion()).to(titleLabel),
                         Left(20.widthProportion()),
                         Right(20.widthProportion()))
    chronicleStack.easy.layout(Top(20.heightProportion()).to(dobStack),
                               Left(20.widthProportion()),
                               Right(20.widthProportion()))
    bloodTypeStack.easy.layout(Top(20.heightProportion()).to(chronicleStack),
                               Left(20.widthProportion()),
                               Right(20.widthProportion()))
    rhesusStack.easy.layout(Top(20.heightProportion()).to(bloodTypeStack),
                            Left(20.widthProportion()),
                            Right(20.widthProportion()))
  }

}
