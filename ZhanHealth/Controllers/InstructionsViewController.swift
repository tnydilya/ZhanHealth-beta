//
//  InstructionsViewController.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class InstructionsViewController: UIViewController {
  
  let conn = Connection()
  var user: User?
  
  lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.delegate = self
    tv.dataSource = self
    tv.backgroundColor = AppColor.gray
    tv.separatorColor = AppColor.green
    tv.isScrollEnabled = false
    tv.tableFooterView = UIView()
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.easy.layout(Edges(0))
    user = conn.getAppUser()
    navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(self.showMenuPanel)), UIBarButtonItem(title: "Instructions", style: .plain, target: self, action: nil)]
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlertController))
    self.hideKeyboardWhenTappedAround()
  }
  
  @objc func showAlertController() {
    if user?.instructions.count == 4 {
      self.showToast(message: "4 is maximum")
    } else {
      let alertController = UIAlertController(title: "Instruction", message: "Add New Instruction", preferredStyle: .alert)
      alertController.addTextField { (textField) in
        textField.placeholder = "Enter Title"
      }
      alertController.addTextField { (textField) in
        textField.placeholder = "Enter Instruction"
      }
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { action -> Void in })
      let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
        if alertController.textFields![0].text == "" || alertController.textFields![0].text == nil ||
          alertController.textFields![1].text == "" || alertController.textFields![1].text == nil {
          self.showToast(message: "Fill out all the fields")
        } else {
          self.addNewInstruction(title: alertController.textFields![0].text!, instruction: alertController.textFields![1].text!)
        }
        
      })
      alertController.addAction(cancelAction)
      alertController.addAction(saveAction)
      
      self.present(alertController, animated: true, completion: nil)
    }
  }
  
  func addNewInstruction(title: String, instruction: String) {
    conn.addInstruction(problem: title, solution: instruction)
    self.tableView.reloadData()
  }

}


extension InstructionsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return user?.instructions.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.backgroundColor = .clear
    cell.textLabel?.font = UIFont(name: Font.medium.rawValue, size: 10.widthProportion())
    cell.textLabel?.textColor = AppColor.blue
    cell.detailTextLabel?.font = UIFont(name: Font.medium.rawValue, size: 15.widthProportion())
    cell.detailTextLabel?.numberOfLines = 0
    cell.textLabel?.text = user?.instructions[indexPath.row].problem
    cell.detailTextLabel?.text = user?.instructions[indexPath.row].solution
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      conn.deleteInstruction(instruction: user!.instructions[indexPath.row])
      self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
  
}


extension InstructionsViewController: UITableViewDelegate{
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)
  }
}
