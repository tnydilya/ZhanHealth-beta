//
//  extensions.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import FAPanels

extension Int{
  func heightProportion() -> CGFloat {
    return CGFloat(self)*Screen.heightProportion
  }
  func widthProportion() -> CGFloat {
    return CGFloat(self)*Screen.widthProportion
  }
}

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  func showToast(message: String) {
    
    let toastWidth = Screen.width-40.widthProportion()
    let toastHeight = 35.heightProportion()
    
    let toastLabel = UILabel(frame: CGRect(x: (Screen.width/2) - (toastWidth/2), y: Screen.height-120.heightProportion(), width: toastWidth, height: toastHeight))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = .white
    toastLabel.textAlignment = .center
    toastLabel.font = UIFont(name: Font.regular.rawValue, size: 12.heightProportion())
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    toastLabel.numberOfLines = 0
    toastLabel.adjustsFontSizeToFitWidth = true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
      toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
      toastLabel.removeFromSuperview()
    })
  }
  
  func showAlert(title: String, text: String, action: @escaping (UIAlertAction) -> Void) {
    let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default ,handler: action))
    self.present(alertController, animated: true, completion: nil)
  }
  
  
  @objc func showMenuPanel() {
    panel?.openLeft(animated: true)
  }
  
}


extension NSMutableAttributedString {
  
  public func setAsLink(textToFind: String, linkURL: String) -> Bool {
    
    let foundRange = self.mutableString.range(of: textToFind)
    if foundRange.location != NSNotFound {
      self.addAttribute(.link, value: linkURL, range: foundRange)
      self.addAttribute(.font, value: UIFont(name: Font.medium.rawValue, size: 11)!, range: foundRange)
      return true
    }
    return false
  }
}


extension UIView {
  func setGradientBackground(){
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.bounds
    gradientLayer.colors = [AppColor.blue.cgColor, AppColor.green.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    self.layer.insertSublayer(gradientLayer, at: 0)
    
  }
}

extension FAPanelController {
  func setCenter(isLoggedIn: Bool = false){
    if isLoggedIn {
      let leftMenuVC = MenuPanelViewController()
      let centerVC = ProfileViewController()
      let centerNavVC = UINavigationController(rootViewController: centerVC)
      centerNavVC.navigationBar.isTranslucent = false
      self.center(centerNavVC).left(leftMenuVC)
    } else {
      self.center(LoginViewController())
    }
}
}

