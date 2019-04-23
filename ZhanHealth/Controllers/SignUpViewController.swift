//
//  SignUpViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  lazy var mainView: SignUpView = {
    let mv = SignUpView()
    mv.signInTextView.delegate = self
    mv.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    return mv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    self.hideKeyboardWhenTappedAround()
  }
  
  @objc func signUp() {
    let conn = Connection()
    if mainView.validate() {
      let reg = conn.register(firstname: mainView.firstNameField.text!,
                                 lastname: mainView.lastNameField.text!,
                                 email: mainView.emailField.text!,
                                 password: mainView.passwordField.text!)
      if reg {
        self.showAlert(title: "Success", text: "You are succesfully registered", action: {_ in
          self.dismiss(animated: true, completion: nil)
        })
      } else {
          showToast(message: "Account already exists")
      }
    }
    }
}


extension SignUpViewController: UITextViewDelegate {
  
  @available(iOS 10.0, *)
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    self.dismiss(animated: true, completion: nil)
    return true
  }
}
