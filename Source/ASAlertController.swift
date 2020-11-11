//
//  ASAlert.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

enum ASAlertControllerType: String {
    case classic
    case photoSelectionOption
}

@available(iOS 9.0, *)
public class ASAlertController: UIViewController {
    var container: UIView?
    var alertTitleLabel: ASAlertTitleLabel?
    var alertMessageLabel: ASAlertMessageLabel?
    var alertActions: [ASAlertAction] = [ASAlertAction]()
    var controllerType: ASAlertControllerType = .classic
    
    var alertTitle: String?
    var alertMessage: String?
    
    var containerPadding: CGFloat = 16
    var padding: CGFloat = 16
    var actionPadding: CGFloat = 4
    
    var withDuration: TimeInterval = 3
    var delay: TimeInterval = 1
}

@available(iOS 9.0, *)
extension ASAlertController {
    @objc func onTap(sender : AnyObject){
        dismissController(container)
    }
}
