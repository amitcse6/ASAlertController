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
    case gonzo
}

@available(iOS 9.0, *)
public class ASAlertController: UIViewController {
    var storeBack: StoreBack?
    public var alertTitleLabel: ASAttributedLabel?
    public var alertMessageLabel: ASAttributedLabel?
    var merginView: UIView?
    var buttonContainer: UIView?
    var alertActions: [ASAlertAction] = [ASAlertAction]()
    var controllerType: ASAlertControllerType = .classic
    
    var alertTitle: String?
    var alertMessage: String?
    
    public var containerSize: CGSize = CGSize(width: -1, height: 200)
    public var containerPadding: CGFloat = 16
    public var padding: CGFloat = 16
    public var actionPadding: CGFloat = 4
    public var buttonContainerHeight: CGFloat = 40
    public var merginColor: UIColor = .gray
    public var cornerRadious: CGFloat = 5
    public var withDuration: TimeInterval = 3
    public var delay: TimeInterval = 1
}

@available(iOS 9.0, *)
extension ASAlertController {
    @objc func onTap(sender : AnyObject){
        //dismissController()
    }
    
    public func setCornerRadious(_ radious: CGFloat) {
        storeBack?.container?.layer.cornerRadius = radious
    }
}

protocol StoreBackDelegate: AnyObject {
    func onTapBack()
}

class StoreBack: UIView {
    var container: UIView?
    weak var delegate: StoreBackDelegate?
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("touches: \(touches.first?.view?.tag)")
        if let touch = touches.first, touch.view != container {
            delegate?.onTapBack()
        }
    }
}

@available(iOS 9.0, *)
extension ASAlertController: StoreBackDelegate {
    func onTapBack() {
        dismissController()
    }
}
