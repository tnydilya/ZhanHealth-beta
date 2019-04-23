//
//  FAPanel+KVO.swift
//  FAPanels
//
//  Created by Dilyara.
//  Copyright © Dilyara. All rights reserved.
//

import Foundation
import UIKit


extension FAPanelController {
    
    

    //  Handling Key Value Observer

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &FAPanelController.kvoContext {
            if keyPath == keyPathOfView {
                if centerPanelVC!.isViewLoaded && configs.canRecognizePanGesture {
                    addPanGesture(toView: centerPanelVC!.view)
                }
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}
