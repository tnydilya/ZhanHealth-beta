//
//  ProfileInstructionTableViewCell.swift
//  ZhanHealth
//
//  Created by Dilyara.
//  Copyright © 2019 Dilyara. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileInstructionTableViewCell: UITableViewCell {
  
  lazy var countLabel: UILabel = {
    let lbl = UILabel()
    lbl.backgroundColor = AppColor.red
    lbl.font = UIFont(name: Font.semiBold.rawValue, size: 15)
    lbl.layer.cornerRadius = 50.widthProportion()/2
    lbl.layer.shadowColor = UIColor.gray.cgColor
    lbl.layer.shadowOffset = CGSize(width: 4, height: 4)
    lbl.layer.shadowRadius = 10
    lbl.layer.shadowOpacity = 0.5
    lbl.layer.masksToBounds = true
    lbl.textColor = .white
    lbl.textAlignment = .center
    return lbl
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
    textLabel?.font = UIFont(name: Font.semiBold.rawValue, size: 10.widthProportion())
    textLabel?.textColor = AppColor.red
    detailTextLabel?.font = UIFont(name: Font.regular.rawValue, size: 12.widthProportion())
    detailTextLabel?.numberOfLines = 0
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setupViews() {
    [countLabel].forEach{
      self.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    countLabel.easy.layout(CenterY(0),
                           Left(0),
                           Size(50.widthProportion()))
    textLabel?.easy.layout(Top(0),
                           Left(20.widthProportion()).to(countLabel),
                           Right(0))
    detailTextLabel?.easy.layout(Top(0).to(textLabel!),
                                 Left(20.widthProportion()).to(countLabel),
                                 Right(20.widthProportion()))
  }

}
