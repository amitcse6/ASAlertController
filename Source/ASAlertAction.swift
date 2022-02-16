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
    var buttonWidth: CGFloat?
    var backColor: UIColor = .white
    var borderColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ title: String?, _ buttonWidth: CGFloat?, _ backColor: UIColor, _ borderColor: UIColor, _ actionClouser: ASAlertActionClouser?) {
        super.init(frame: CGRect.zero)
        self.title = title
        self.buttonWidth = buttonWidth
        self.backColor = backColor
        self.borderColor = borderColor
        self.actionClouser = actionClouser
        setup()
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        container = UIView()
        container?.backgroundColor = .clear
        
        addSubview(container.unsafelyUnwrapped)
        
        button = UIButton()
        button?.backgroundColor = .clear
        button?.tintColor = .clear
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
    
    func setBackgroundColor(_ color: UIColor) {
        container?.backgroundColor = color
        button?.tintColor = color
        button?.backgroundColor = color
    }
    
    func setCurveStyle1() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
    
    @objc func touchUpInsideEvent(_ button: UIButton) {
        actionClouser?()
    }
}
