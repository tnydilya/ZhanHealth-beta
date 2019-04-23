//
//  TodayViewController.swift
//  Widget
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import NotificationCenter
import EasyPeasy

class TodayViewController: UIViewController, NCWidgetProviding {
  
  lazy var sosButton: UIButton = {
    let but = UIButton()
    but.backgroundColor = UIColor.red
    but.layer.cornerRadius = 10
    but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
    but.setTitle("SOS", for: .normal)
    but.layer.shadowColor = UIColor.gray.cgColor
    but.layer.shadowOffset = CGSize(width: 2, height: 2)
    but.layer.shadowRadius = 2
    but.layer.shadowOpacity = 0.7
    but.addTarget(self, action: #selector(openApp), for: .touchUpInside)
    return but
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(sosButton)
    sosButton.easy.layout(Center(0),
                          Width(300),
                          Height(100))
  }
  
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    completionHandler(NCUpdateResult.newData)
  }
  
  @objc func openApp() {
    extensionContext?.open(URL(string: "ZhanHealth://emergency")!, completionHandler: nil)
  }
  
}
