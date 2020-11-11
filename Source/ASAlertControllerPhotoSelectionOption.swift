//
//  ASAlertControllerPhotoSelectionOption.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
public class ASAlertControllerPhotoSelectionOption: ASAlertController {
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(_ title: String?, _ message: String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.controllerType = .photoSelectionOption
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
        self.view.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.7)
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(ASAlertGestureRecognizer(target: self, action: #selector(onTap)))
        
        container = UIView()
        container?.backgroundColor = .white
        setShadow(UIColor(asaValue: "#ffffff", alpha: 1.0), UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), UIColor(asaValue: "#AAAAAA", alpha: 1.0), 5, scale: true, maskedCorners: [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        self.view.addSubview(container.unsafelyUnwrapped)
        
        alertTitleLabel = ASAlertTitleLabel(alertTitle)
        self.container?.addSubview(alertTitleLabel.unsafelyUnwrapped)
        
        alertMessageLabel = ASAlertMessageLabel(alertMessage)
        self.container?.addSubview(alertMessageLabel.unsafelyUnwrapped)
    }
    
    public func setupConstraints() {
    }
}
