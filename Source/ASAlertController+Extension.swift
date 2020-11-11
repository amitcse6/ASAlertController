//
//  ASAlert+Extension.swift
//  eKYC
//
//  Created by AMIT on 11/8/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension UIViewController {
    @discardableResult
    public func alertShow(_ alert: ASAlertController) -> ASAlertController {
        return alert.show(self)
    }
}

@available(iOS 9.0, *)
extension ASAlertController {
    @discardableResult public func show(_ parents: UIViewController? = nil) -> ASAlertController {
        switch controllerType {
        case .classic:
            setupClassicConstraints()
        case .photoSelectionOption:
            setupPhotoSelectionOptionConstraints()
        }
        self.view.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .crossDissolve
        parents?.present(self, animated: false, completion: nil)
        return self
    }
    
    public func dismissController(_ container: UIView?) {
        self.dismiss(animated: false) {
        }
    }
    
    func setupClassicConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        container?.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: containerPadding).isActive = true
        container?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: containerPadding).isActive = true
        container?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -containerPadding).isActive = true
        container?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -containerPadding).isActive = true
        container?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        alertTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertTitleLabel?.topAnchor.constraint(equalTo: container!.topAnchor, constant: padding).isActive = true
        alertTitleLabel?.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: padding).isActive = true
        alertTitleLabel?.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -padding).isActive = true
        alertTitleLabel?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        alertMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel?.topAnchor.constraint(equalTo: alertTitleLabel!.bottomAnchor, constant: padding).isActive = true
        alertMessageLabel?.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: padding).isActive = true
        alertMessageLabel?.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -padding).isActive = true
        alertMessageLabel?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        for (index, action) in alertActions.enumerated() {
            action.backgroundColor = .asarandom
            container?.addSubview(action)
            action.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                action.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: actionPadding).isActive = true
            }else {
                action.leftAnchor.constraint(equalTo: alertActions[index-1].rightAnchor, constant: actionPadding).isActive = true
            }
            if index == alertActions.count - 1 {
                action.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -actionPadding).isActive = true
            }
            action.bottomAnchor.constraint(equalTo: container!.bottomAnchor, constant: -actionPadding).isActive = true
            action.widthAnchor.constraint(equalTo: alertActions.first!.widthAnchor).isActive = true
        }
    }
    
    func setupPhotoSelectionOptionConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        container?.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: containerPadding).isActive = true
        container?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: containerPadding).isActive = true
        container?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -containerPadding).isActive = true
        container?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -containerPadding).isActive = true
        container?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        alertTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertTitleLabel?.topAnchor.constraint(equalTo: container!.topAnchor, constant: 0).isActive = true
        alertTitleLabel?.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: 0).isActive = true
        alertTitleLabel?.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -0).isActive = true
        alertTitleLabel?.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        alertMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel?.topAnchor.constraint(equalTo: alertTitleLabel!.bottomAnchor, constant: 0).isActive = true
        alertMessageLabel?.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: 0).isActive = true
        alertMessageLabel?.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -0).isActive = true
        alertMessageLabel?.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        for (index, action) in alertActions.enumerated() {
            action.backgroundColor = .asarandom
            container?.addSubview(action)
            action.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                action.topAnchor.constraint(equalTo: container!.topAnchor, constant: actionPadding).isActive = true
            }else {
                action.topAnchor.constraint(equalTo: alertActions[index-1].bottomAnchor, constant: actionPadding).isActive = true
            }
            action.leftAnchor.constraint(equalTo: container!.leftAnchor, constant: actionPadding).isActive = true
            action.rightAnchor.constraint(equalTo: container!.rightAnchor, constant: -actionPadding).isActive = true
            if index == alertActions.count - 1 {
                action.bottomAnchor.constraint(equalTo: container!.bottomAnchor, constant: -actionPadding).isActive = true
            }
            action.heightAnchor.constraint(equalTo: alertActions.first!.heightAnchor).isActive = true
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if  let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        } else {
            if  let tabVC = controller as? UITabBarController,
                let selectedVC = tabVC.selectedViewController {
                presentFromController(controller: selectedVC, animated: animated, completion: completion)
            } else {
                controller.present(self, animated: animated, completion: completion)
            }
        }
    }
    
    public static var asaRootViewController: UIViewController? {
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }
        return rootViewController
    }
    
    public static var topMostVC: UIViewController? {
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }
        if presentedVC == nil {
            print("Error: You don't have any views set.")
        }
        return presentedVC
    }
}
