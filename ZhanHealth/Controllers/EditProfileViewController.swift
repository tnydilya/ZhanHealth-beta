//
//  EditProfileViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class EditProfileViewController: UIViewController {
  
  let conn = Connection()
  
  lazy var mainView: SignUpView = {
    let mv = SignUpView()
    mv.logoView.image = nil
    mv.appNameLabel.text = nil
    mv.signInTextView.text = nil
    mv.signUpButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    mv.signUpButton.setTitle("Save", for: .normal)
    mv.firstNameField.easy.layout(Top(30.heightProportion()))
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    view.backgroundColor = AppColor.gray
    self.hideKeyboardWhenTappedAround()
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Edit Profile", style: .plain, target: self, action: nil)]
    setData()
  }
  
  func setData() {
    if let user = conn.getAppUser() {
      mainView.firstNameField.text = user.firstname
      mainView.lastNameField.text = user.lastname
      mainView.emailField.text = user.email
      mainView.passwordField.text = user.password
      mainView.confirmPasswordField.text = user.password
    }
  }
  
  @objc func save() {
    if mainView.validate() {
      conn.updateProfile(firstname: mainView.firstNameField.text!,
                         lastname: mainView.lastNameField.text!,
                         email: mainView.emailField.text!,
                         password: mainView.passwordField.text!)
    }
    self.showToast(message: "Saved")
  }
  
}
