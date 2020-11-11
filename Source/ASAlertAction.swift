//
//  ASAlertAction.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

public typealias ASAlertActionClouser = () -> Void

@available(iOS 9.0, *)
public class ASAlertAction: UIView {
    var container: UIView?
    var button: UIButton?
    var title: String?
    var actionClouser: ASAlertActionClouser?
    var containerPadding: CGFloat = 4
    var padding: CGFloat = 4
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ title: String?, _ actionClouser: ASAlertActionClouser?) {
        super.init(frame: CGRect.zero)
        self.title = title
        self.actionClouser = actionClouser
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
        
        button = UIButton()
        button?.backgroundColor = .clear
        button?.setTitle(title, for: .normal)
        button?.titleLabel?.textAlignment = .center
        button?.titleLabel?.numberOfLines = 0
        button?.setTitleColor(.black, for: .normal)
        button?.addTarget(self, action: #selector(touchUpInsideEvent(_:)), for: .touchUpInside)
        addSubview(button.unsafelyUnwrapped)
    }
    
    public func setupConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        container?.topAnchor.constraint(equalTo: topAnchor, constant: containerPadding).isActive = true
        container?.leftAnchor.constraint(equalTo: leftAnchor, constant: containerPadding).isActive = true
        container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -containerPadding).isActive = true
        container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -containerPadding).isActive = true
        
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.topAnchor.constraint(equalTo: container!.topAnchor, constant: padding).isActive = true
        button?.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: padding).isActive = true
        button?.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -padding).isActive = true
        button?.bottomAnchor.constraint(equalTo: container!.bottomAnchor, constant: -padding).isActive = true
    }
    
    @objc func touchUpInsideEvent(_ button: UIButton) {
        actionClouser?()
    }
}
