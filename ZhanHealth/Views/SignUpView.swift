//
//  SignUpView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class SignUpView: UIView {
  
  lazy var logoView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "logo")
    return iv
  }()
  
  lazy var appNameLabel: UILabel = {
    let appNameLabel = UILabel()
    appNameLabel.text = "ZhanHealth"
    appNameLabel.textColor = AppColor.blue
    appNameLabel.font = UIFont(name: Font.medium.rawValue, size: 14.widthProportion())
    return appNameLabel
  }()
  
  lazy var firstNameField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "First Name"
    return field
  }()
  
  lazy var lastNameField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Last Name"
    return field
  }()
  
  lazy var emailField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Email address"
    field.keyboardType = .emailAddress
    return field
  }()
  
  lazy var passwordField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Password"
    field.isSecureTextEntry = true
    return field
  }()
  
  lazy var confirmPasswordField: FormTextField = {
    let field = FormTextField()
    field.placeholder = "Confirm Password"
    field.isSecureTextEntry = true
    return field
  }()
  
  lazy var signUpButton: SubmitButton = {
    let button = SubmitButton()
    button.setTitle("Sign Up", for: .normal)
    return button
  }()
  
  lazy var signInTextView: LinkTextView = {
    let tv = LinkTextView()
    let attributedString = NSMutableAttributedString(string: "Have an account? Sign In here")
    let ok = attributedString.setAsLink(textToFind: "Sign In", linkURL: "signIn")
    if ok {
      tv.attributedText = attributedString
    }
    tv.textAlignment = .center
    return tv
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
  
  func validate() -> Bool {
    if self.firstNameField.text == nil || self.firstNameField.text == "" {
      self.firstNameField.errorMessage = "Enter Firstname"
      return false
    }
    if self.lastNameField.text == nil || self.lastNameField.text == "" {
      self.lastNameField.errorMessage = "Enter Lastname"
      return false
    }
    if self.emailField.text == nil || self.emailField.text == "" {
      self.emailField.errorMessage = "Enter Email"
      return false
    }
    if self.passwordField.text == nil || self.passwordField.text == "" {
      self.passwordField.errorMessage = "Enter Password"
      return false
    }
    if self.confirmPasswordField.text == nil || self.confirmPasswordField.text == "" {
      self.confirmPasswordField.errorMessage = "Confirm Password"
      return false
    }
    if self.passwordField.text != self.confirmPasswordField.text {
      self.passwordField.errorMessage = "Passwords don't match"
      self.confirmPasswordField.errorMessage = "Passwords don't match"
      return false
    }
    return true
  }
  
  fileprivate func setupViews(){
    [logoView, appNameLabel, firstNameField, lastNameField, emailField, passwordField, confirmPasswordField, signUpButton, signInTextView].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    logoView.easy.layout(Top(30.heightProportion()),
                         CenterX(0),
                         Size(90.widthProportion()))
    appNameLabel.easy.layout(Top(5.heightProportion()).to(logoView),
                             CenterX(0))
    firstNameField.easy.layout(Top(15.heightProportion()).to(appNameLabel),
                               CenterX(0),
                               Width(315.widthProportion()),
                               Height(55.heightProportion()))
    lastNameField.easy.layout(Top(7.heightProportion()).to(firstNameField),
                              CenterX(0),
                              Width().like(firstNameField),
                              Height().like(firstNameField))
    emailField.easy.layout(Top(7.heightProportion()).to(lastNameField),
                           CenterX(0),
                           Width().like(firstNameField),
                           Height().like(firstNameField))
    passwordField.easy.layout(Top(7.heightProportion()).to(emailField),
                              CenterX(0),
                              Width().like(firstNameField),
                              Height().like(firstNameField))
    confirmPasswordField.easy.layout(Top(7.heightProportion()).to(passwordField),
                                     CenterX(0),
                                     Width().like(firstNameField),
                                     Height().like(firstNameField))
    signUpButton.easy.layout(Top(35.heightProportion()).to(confirmPasswordField),
                             CenterX(0),
                             Width().like(firstNameField),
                             Height(45.heightProportion()))
    signInTextView.easy.layout(Top(30.heightProportion()).to(signUpButton),
                               CenterX(0),
                               Width().like(firstNameField),
                               Height(30.heightProportion()))
  }


}
