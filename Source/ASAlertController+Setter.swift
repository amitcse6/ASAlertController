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
    public func action(_ title: String, _ buttonWidth: CGFloat?, _ backColor: UIColor, _ borderColor: UIColor, _ actionClouser: @escaping ASAlertActionClouser) -> ASAlertController {
        alertActions.append(ASAlertAction(title, buttonWidth, backColor, borderColor, actionClouser))
        return self
    }
    
    @discardableResult
    public func setShadow(_ backgroundColor: UIColor, _ borderColor: UIColor, _ shadowColor: UIColor, _ shadowRadius: CGFloat, scale: Bool, maskedCorners: CACornerMask) -> ASAlertController {
        self.storeBack!.container?.layer.shouldRasterize = true
        self.storeBack!.container?.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        self.storeBack!.container?.backgroundColor = backgroundColor
        self.storeBack!.container?.layer.cornerRadius = shadowRadius
        self.storeBack!.container?.layer.borderColor = borderColor.cgColor
        self.storeBack!.container?.layer.borderWidth = 1
        self.storeBack!.container?.layer.shadowColor = shadowColor.cgColor
        self.storeBack!.container?.layer.shadowOpacity = 1
        self.storeBack!.container?.layer.shadowOffset = CGSize.zero
        self.storeBack!.container?.layer.shadowRadius = shadowRadius
        if #available(iOS 11.0, *) {
            self.storeBack!.container?.layer.maskedCorners = maskedCorners
        } else {
            // Fallback on earlier versions
        }
        return self
    }
}
