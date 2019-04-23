//
//  MedCardView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class MedCardView: UIView {
  
  lazy var dateField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Date of birth:  DD/MM/YYYY"
    return field
  }()
  
  lazy var diseasesField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Chronicle diseases"
    return field
  }()
  
  lazy var bloodField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Blood type"
    return field
  }()
  
  lazy var rhesusField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Rhesus factor"
    return field
  }()
  
  lazy var submitButton: SubmitButton = {
    let btn = SubmitButton()
    btn.setTitle("Save", for: .normal)
    return btn
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
    [dateField, diseasesField, bloodField, rhesusField, submitButton].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    dateField.easy.layout(Top(20.heightProportion()),
                          Width(315.widthProportion()),
                          CenterX(0),
                          Height(60.heightProportion()))
    diseasesField.easy.layout(Top(15.heightProportion()).to(dateField),
                              Width().like(dateField),
                              CenterX(0),
                              Height().like(dateField))
    bloodField.easy.layout(Top(15.heightProportion()).to(diseasesField),
                           Width().like(dateField),
                           CenterX(0),
                           Height().like(dateField))
    rhesusField.easy.layout(Top(15.heightProportion()).to(bloodField),
                            Width().like(dateField),
                            CenterX(0),
                            Height().like(dateField))
    submitButton.easy.layout(Top(60.heightProportion()).to(rhesusField),
                             Width().like(dateField),
                             CenterX(0),
                             Height().like(dateField))
  }

}
