//
//  ASAlertAction+Setter.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit
@available(iOS 9.0, *)
extension ASAlertController {
    @discardableResult
    public func action(_ title: String, _ actionClouser: @escaping ASAlertActionClouser) -> ASAlertController {
        alertActions.append(ASAlertAction(title, actionClouser))
        return self
    }
    
    @discardableResult
    public func setShadow(_ backgroundColor: UIColor, _ borderColor: UIColor, _ shadowColor: UIColor, _ shadowRadius: CGFloat, scale: Bool, maskedCorners: CACornerMask) -> ASAlertController {
        self.container?.layer.shouldRasterize = true
        self.container?.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        self.container?.backgroundColor = backgroundColor
        self.container?.layer.cornerRadius = shadowRadius
        self.container?.layer.borderColor = borderColor.cgColor
        self.container?.layer.borderWidth = 1
        self.container?.layer.shadowColor = shadowColor.cgColor
        self.container?.layer.shadowOpacity = 1
        self.container?.layer.shadowOffset = CGSize.zero
        self.container?.layer.shadowRadius = shadowRadius
        if #available(iOS 11.0, *) {
            self.container?.layer.maskedCorners = maskedCorners
        } else {
            // Fallback on earlier versions
        }
        return self
    }
}
