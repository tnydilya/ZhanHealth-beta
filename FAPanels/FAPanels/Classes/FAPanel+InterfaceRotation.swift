//
//  FAPanel+InterfaceRotation.swift
//  FAPanels
//
//  Created by Dilyara.
//  Copyright © Dilyara. All rights reserved.
//

import Foundation
import UIKit



extension FAPanelController {
    
    
    
    //  Handling Interface Rotations

    override open var shouldAutorotate: Bool {
        get {
            guard let visiblePanel = visiblePanelVC else { return true }
            
            if configs.handleAutoRotation && visiblePanel.responds(to: #selector(getter: self.shouldAutorotate)) {
                return visiblePanel.shouldAutorotate
            }
            else {
                return true
            }
        }
    }
    
    
    override open func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
        centerPanelContainer.frame = updateCenterPanelSlidingFrame()
        layoutSideContainers(withDuration: duration, animated: true)
        layoutSidePanelVCs()
        
        if centerPanelHidden {
            var frame: CGRect  = centerPanelContainer.frame
            frame.origin.x = state == .left ? centerPanelContainer.frame.size.width : -centerPanelContainer.frame.size.width
            centerPanelContainer.frame = frame
        }
    }
    
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        
        switch state {
        case .center:
            return centerPanelVC!.preferredStatusBarStyle
        case .left:
            return leftPanelVC!.preferredStatusBarStyle
        case .right:
            return rightPanelVC!.preferredStatusBarStyle
        }
    }
}

