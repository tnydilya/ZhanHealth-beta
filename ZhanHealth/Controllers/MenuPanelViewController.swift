//
//  MenuPanelViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class MenuPanelViewController: UIViewController {
  
  let conn = Connection()
  
  lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.delegate = self
    tv.dataSource = self
    tv.backgroundColor = .white
    tv.separatorColor = .clear
    tv.isScrollEnabled = false
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.easy.layout(Edges(0), Top(50))
  }
  
}

extension MenuPanelViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.font = UIFont(name: Font.medium.rawValue, size: 15.widthProportion())
    var title = ""
    var imageName = ""
    switch indexPath.row {
    case 0:
      imageName = "profile"
      title = "Profile"
    case 1:
      imageName = "med_card"
      title = "Med Card"
    case 2:
      imageName = "instructions"
      title = "Instructions"
    case 3:
      imageName = "contacts"
      title = "Contacts"
    case 4:
      imageName = "faq"
      title = "FAQ"
    default:
      break
    }
    cell.imageView?.image = UIImage(named: imageName)
    cell.textLabel?.text = title
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50.heightProportion()
  }
  
}


extension MenuPanelViewController: UITableViewDelegate{
  
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = MenuPanelHeaderView()
    headerView.easy.layout(Height(100.heightProportion()),Width(250.widthProportion()))
    headerView.easy.layout(Edges(0))
    if let user = conn.getAppUser() {
      headerView.nameLabel.text = (user.firstname! + " " + user.lastname!)
    }
    return headerView
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)
    let navVC = UINavigationController()
    navVC.navigationBar.isTranslucent = false
    switch indexPath.row {
    case 0:
      navVC.viewControllers = [ProfileViewController()]
    case 1:
      navVC.viewControllers = [MedCardViewController()]
    case 2:
      navVC.viewControllers = [InstructionsViewController()]
    case 3:
      navVC.viewControllers = [ContactsViewController()]
    case 4:
      navVC.viewControllers = [EmergencyViewController()]
    default:
      break
    }
    panel?.center(navVC)
    panel?.openCenter(animated: true)
  }
}
