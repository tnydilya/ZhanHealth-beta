//
//  ProfileViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileViewController: UIViewController {
  
  let conn = Connection()
  var user: User?
  
  lazy var headerView: ProfileHeaderView = {
    let hv = ProfileHeaderView()
    hv.buttonsStack.medCardButton.addTarget(self, action: #selector(toggleViews(sender:)), for: .touchUpInside)
    hv.buttonsStack.instructionsButton.addTarget(self, action: #selector(toggleViews(sender:)), for: .touchUpInside)
    hv.buttonsStack.contactsButton.addTarget(self, action: #selector(toggleViews(sender: )), for: .touchUpInside)
    return hv
  }()
  
  lazy var medCardView: ProfileMedCardView = {
    let mcv = ProfileMedCardView()
    mcv.isHidden = true
    return mcv
  }()
  
  lazy var instuctionsView: ProfileInstructionsView = {
    let iv = ProfileInstructionsView()
    iv.isHidden = false
    return iv
  }()
  
  lazy var contactsView: ProfileContactsView = {
    let iv = ProfileContactsView()
    iv.isHidden = true
    return iv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    user = conn.getAppUser()!
    view.backgroundColor = AppColor.gray
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Profile", style: .plain, target: self, action: nil)]
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editProfile))
    setupViews()
    setupConstraints()
    headerView.nameLabel.text = user!.firstname! + " " + user!.lastname!
    medCardView.setData(user: user!)
    instuctionsView.addUserInstructions(user: user!)
    contactsView.addUserContacts(user: user!)
  }
  
  @objc func toggleViews(sender: UIButton) {
    var anim: (() -> Void)?
    switch sender {
    case headerView.buttonsStack.medCardButton:
      anim = {
        self.instuctionsView.isHidden = true
        self.contactsView.isHidden = true
        self.medCardView.isHidden = false
      }
    case headerView.buttonsStack.instructionsButton:
      anim = {
        self.contactsView.isHidden = true
        self.medCardView.isHidden = true
        self.instuctionsView.isHidden = false
      }
    case headerView.buttonsStack.contactsButton:
      anim = {
        self.instuctionsView.isHidden = true
        self.medCardView.isHidden = true
        self.contactsView.isHidden = false
      }
    default:
      break
    }
    UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: anim)
  }
  
  @objc func editProfile() {
    let centerVC = EditProfileViewController()
    let centerNavVC = UINavigationController(rootViewController: centerVC)
    centerNavVC.navigationBar.isTranslucent = false
    panel?.center(centerNavVC)
    panel?.openCenter(animated: true)
  }
  
  fileprivate func setupViews(){
    [headerView, medCardView, instuctionsView, contactsView].forEach {
      self.view.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    headerView.easy.layout(Top(20.heightProportion()),
                           Left(20.widthProportion()),
                           Right(20.widthProportion()),
                           Height(200.heightProportion()))
    medCardView.easy.layout(Top(20.heightProportion()).to(headerView),
                                Left(20.widthProportion()),
                                Right(20.widthProportion()),
                                Bottom(100.heightProportion()))
    instuctionsView.easy.layout(Top(20.heightProportion()).to(headerView),
                            Left(20.widthProportion()),
                            Right(20.widthProportion()),
                            Bottom(30.heightProportion()))
    contactsView.easy.layout(Top(20.heightProportion()).to(headerView),
                                Left(20.widthProportion()),
                                Right(20.widthProportion()),
                                Bottom(100.heightProportion()))
  }
  
}
