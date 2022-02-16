//
//  UIView+Extension.swift
//  ASAlertController
//
//  Created by AMIT on 2/16/22.
//

import Foundation
import UIKit

extension UIView {
    func setCurveStyle1(_ color: UIColor) {
        layer.cornerRadius = 0
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
}