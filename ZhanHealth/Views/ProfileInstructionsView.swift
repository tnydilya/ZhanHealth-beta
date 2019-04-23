//
//  ProfileInstructionsView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileInstructionsView: UIView {

  lazy var titleLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.medium.rawValue, size: 16)
    lbl.text = "Instructions: How to help?"
    return lbl
  }()
  
  lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.isScrollEnabled = false
    tv.tableFooterView = UIView()
    tv.dataSource = self
    tv.delegate = self
    tv.separatorColor = .clear
    tv.register(ProfileInstructionTableViewCell.self, forCellReuseIdentifier: "cell")
    tv.allowsSelection = false
    return tv
  }()
  
  var user: User?
  
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
  
  func addUserInstructions(user: User) {
    self.user = user
    self.tableView.reloadData()
  }
  
  fileprivate func setupViews(){
    [titleLabel, tableView].forEach {
      self.addSubview($0)
    }
  }
  
  fileprivate func setupConstraints() {
    titleLabel.easy.layout(Top(20.heightProportion()),
                           CenterX(0))
    tableView.easy.layout(Top(20.heightProportion()).to(titleLabel),
                          Left(20.widthProportion()),
                          Right(20.widthProportion()),
                          Bottom(20.widthProportion()))
  }

}


extension ProfileInstructionsView: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return user?.instructions.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ProfileInstructionTableViewCell = ProfileInstructionTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
    cell.countLabel.text = "\(indexPath.row+1)"
    cell.textLabel?.text = user?.instructions[indexPath.row].problem
    cell.detailTextLabel?.text = user?.instructions[indexPath.row].solution
    return cell
  }

}

extension ProfileInstructionsView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60.heightProportion()
  }

}
