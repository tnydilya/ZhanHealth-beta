//
//  ProfileContactsView.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileContactsView: UIView {
  
  var user: User?

  lazy var titleLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: Font.medium.rawValue, size: 16)
    lbl.text = "Contacts"
    return lbl
  }()
  
  lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.isScrollEnabled = false
    tv.tableFooterView = UIView()
    tv.dataSource = self
    tv.delegate = self
    tv.separatorColor = .clear
    return tv
  }()
  
  
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
  
  func addUserContacts(user: User) {
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
    tableView.easy.layout(Top(0).to(titleLabel),
                          Left(20.widthProportion()),
                          Right(20.widthProportion()),
                          Bottom(20.widthProportion()))
  }
  
}

extension ProfileContactsView: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return user?.contacts.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.font = UIFont(name: Font.medium.rawValue, size: 10.widthProportion())
    cell.detailTextLabel?.font = UIFont(name: Font.medium.rawValue, size: 15.widthProportion())
    cell.textLabel?.text = user?.contacts[indexPath.row].name
    cell.detailTextLabel?.text = user?.contacts[indexPath.row].phone
    return cell
  }

}


extension ProfileContactsView: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60.heightProportion()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

