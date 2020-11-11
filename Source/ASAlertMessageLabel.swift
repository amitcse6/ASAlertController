//
//  ASAlertMessageLabel.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit
@available(iOS 9.0, *)
public class ASAlertMessageLabel: UIView {
    var container: UIView?
    var alertMessageLabel: UILabel?
    var alertMessage: String?
    var containerPadding: CGFloat = 0
    var padding: CGFloat = 0
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ title: String?) {
        super.init(frame: CGRect.zero)
        self.alertMessage = title
        setup()
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        container = UIView()
        container?.backgroundColor = .white
        addSubview(container.unsafelyUnwrapped)
        
        alertMessageLabel = UILabel()
        alertMessageLabel?.textColor = .black
        alertMessageLabel?.font = UIFont.systemFont(ofSize: 15)
        alertMessageLabel?.text = alertMessage
        container?.addSubview(alertMessageLabel.unsafelyUnwrapped)
    }
    
    public func setupConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        container?.topAnchor.constraint(equalTo: topAnchor, constant: containerPadding).isActive = true
        container?.leftAnchor.constraint(equalTo: leftAnchor, constant: containerPadding).isActive = true
        container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -containerPadding).isActive = true
        container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -containerPadding).isActive = true
        
        alertMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel?.topAnchor.constraint(equalTo: container!.topAnchor, constant: padding).isActive = true
        alertMessageLabel?.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: padding).isActive = true
        alertMessageLabel?.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -padding).isActive = true
        alertMessageLabel?.bottomAnchor.constraint(equalTo: container!.bottomAnchor, constant: -padding).isActive = true
    }
}

