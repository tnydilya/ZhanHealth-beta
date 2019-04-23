//
//  LoginView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class LoginView: UIView {
  
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
  
  lazy var emailField: FormTextField = {
    let emailField = FormTextField()
    emailField.placeholder = "Email address"
    emailField.keyboardType = .emailAddress
    return emailField
  }()
  
  lazy var passwordField: FormTextField = {
    let passwordField = FormTextField()
    passwordField.placeholder = "Password"
    passwordField.isSecureTextEntry = true
    return passwordField
  }()
  
  lazy var signInButton: SubmitButton = {
    let signIn = SubmitButton()
    signIn.setTitle("Sign In", for: .normal)
    return signIn
  }()
  
  lazy var signUpTextView: LinkTextView = {
    let tv = LinkTextView()
    let attributedString = NSMutableAttributedString(string: "New user? Sign Up here")
    let ok = attributedString.setAsLink(textToFind: "Sign Up", linkURL: "signUp")
    if ok {
      tv.attributedText = attributedString
    }
    tv.textAlignment = .center
    return tv
  }()
  
  lazy var termsAndPolicy: LinkTextView = {
    let tv = LinkTextView()
    let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms of Service and Privacy Policy")
    let ok = attributedString.setAsLink(textToFind: "Terms of Service", linkURL: "TermsofService")
    let ok2 = attributedString.setAsLink(textToFind: "Privacy Policy", linkURL: "PrivacyPolicy")
    if ok, ok2 {
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
  
  fileprivate func setupViews(){
    [logoView, appNameLabel, emailField, passwordField, signInButton, signUpTextView, termsAndPolicy].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    logoView.easy.layout(Top(30.heightProportion()),
                          CenterX(0),
                          Size(90.widthProportion()))
    appNameLabel.easy.layout(Top(5.heightProportion()).to(logoView),
                             CenterX(0))
    emailField.easy.layout(Top(25.heightProportion()).to(appNameLabel),
                           Width(315.widthProportion()),
                           Height(60.heightProportion()),
                           CenterX(0))
    passwordField.easy.layout(Top(25.heightProportion()).to(emailField),
                              CenterX(0),
                              Width().like(emailField),
                              Height().like(emailField))
    signInButton.easy.layout(Top(75.heightProportion()).to(passwordField),
                       Width().like(emailField),
                       Height(50.heightProportion()),
                       CenterX(0))
    signUpTextView.easy.layout(Top(45.heightProportion()).to(signInButton),
                               CenterX(0),
                               Height(30.heightProportion()),
                               Width().like(emailField))
    termsAndPolicy.easy.layout(Bottom(20.heightProportion()),
                               CenterX(0),
                               Width().like(emailField),
                               Height(60.heightProportion()))
  }


}

