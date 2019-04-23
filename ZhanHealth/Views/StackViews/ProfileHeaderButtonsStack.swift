//
//  ProfileHeaderButtonsStack.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class ProfileHeaderButtonsStack: UIStackView {
  
  lazy var medCardButton: ProfileHeaderButton = {
    let phb = ProfileHeaderButton()
    phb.setImage(UIImage(named: "med_card"), for: .normal)
    phb.setTitle("MedCard", for: .normal)
    phb.setTitleColor(.black, for: .normal)
    return phb
  }()
  
  lazy var instructionsButton: ProfileHeaderButton = {
    let phb = ProfileHeaderButton()
    phb.setImage(UIImage(named: "instructions"), for: .normal)
    phb.setTitle("Instructions", for: .normal)
    phb.setTitleColor(.black, for: .normal)
    return phb
  }()
  
  lazy var contactsButton: ProfileHeaderButton = {
    let phb = ProfileHeaderButton()
    phb.setImage(UIImage(named: "contacts"), for: .normal)
    phb.setTitle("Contacts", for: .normal)
    phb.setTitleColor(.black, for: .normal)
    return phb
  }()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.axis = .horizontal
    self.distribution = .fillEqually
    setupViews()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews(){
    [medCardButton, instructionsButton, contactsButton].forEach {
      self.addArrangedSubview($0)
    }
  }


}
