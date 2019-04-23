//
//  MedCardViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class MedCardViewController: UIViewController {
  
  let conn = Connection()
  
  lazy var mainView: MedCardView = {
    let mv = MedCardView()
    mv.submitButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    self.hideKeyboardWhenTappedAround()
    setData()
    view.backgroundColor = AppColor.gray
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Med Card", style: .plain, target: self, action: nil)]
  }
  
  func setData() {
    if let user = conn.getAppUser() {
      if let medCard = user.medicalCard {
        mainView.dateField.text = medCard.dob
        mainView.diseasesField.text = medCard.diseases
        mainView.bloodField.text = medCard.bloodType
        mainView.rhesusField.text = medCard.rhesusFactor

      }
    }
  }
  
  @objc func save() {
    conn.addOrUpdateMedCard(dob: mainView.dateField.text,
                        diseases: mainView.diseasesField.text,
                        bloodType: mainView.bloodField.text,
                        rhesusFactor: mainView.rhesusField.text)
    self.showToast(message: "Saved")
  }
  
}
