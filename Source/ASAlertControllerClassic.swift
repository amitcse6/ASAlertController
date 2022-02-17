//
//  ASAlertClassic.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
public class ASAlertControllerClassic: ASAlertController {
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ title: String?, _ message: String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.controllerType = .classic
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        //self.view.isUserInteractionEnabled = true
        //self.view.addGestureRecognizer(ASAlertGestureRecognizer(target: self, action: #selector(onTap)))
        
        storeBack = StoreBack()
        storeBack?.delegate = self
        self.view.addSubview(storeBack.unsafelyUnwrapped)
        
        storeBack!.container = UIView()
        setShadow(UIColor(asaValue: "#ffffff", alpha: 1.0), UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), UIColor(asaValue: "#AAAAAA", alpha: 1.0), 5, scale: true, maskedCorners: [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        self.storeBack?.addSubview(storeBack!.container.unsafelyUnwrapped)
        
        alertTitleLabel = ASAAttributedLabel()
        alertTitleLabel?.text = alertTitle
        alertTitleLabel?.textAlignment = .left
        self.storeBack!.container?.addSubview(alertTitleLabel.unsafelyUnwrapped)
        
        alertMessageLabel = ASAAttributedLabel()
        alertMessageLabel?.text = alertMessage
        alertMessageLabel?.textAlignment = .left
        self.storeBack!.container?.addSubview(alertMessageLabel.unsafelyUnwrapped)
    }
    
    public func setupConstraints() {
    }
}

