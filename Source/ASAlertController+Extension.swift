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
    public func asAlertShow(_ alert: ASAlertController) -> ASAlertController {
        return alert.show(self)
    }

    public func asAlertClose(_ alert: ASAlertController) {
        alert.dismissController()
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
        case .gonzo:
            setupGonzoConstraints()
        }
        self.view.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        parents?.present(self, animated: false, completion: nil)
        return self
    }
    
    public func dismissController() {
        self.dismiss(animated: false) {
        }
    }
    
    func setupClassicConstraints() {
        storeBack?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        storeBack?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        storeBack?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0).isActive = true
        storeBack?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
        
        storeBack?.container?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.container?.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: containerPadding).isActive = true
        storeBack?.container?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: containerPadding).isActive = true
        storeBack?.container?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -containerPadding).isActive = true
        storeBack?.container?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -containerPadding).isActive = true
        storeBack?.container?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeBack?.container?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        storeBack?.container?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        alertTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertTitleLabel?.topAnchor.constraint(equalTo: storeBack!.container!.topAnchor, constant: padding).isActive = true
        alertTitleLabel?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: padding).isActive = true
        alertTitleLabel?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -padding).isActive = true
        alertTitleLabel?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        alertMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel?.topAnchor.constraint(equalTo: alertTitleLabel!.bottomAnchor, constant: padding).isActive = true
        alertMessageLabel?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: padding).isActive = true
        alertMessageLabel?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -padding).isActive = true
        alertMessageLabel?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        for (index, action) in alertActions.enumerated() {
            action.setBackgroundColor(.asarandom)
            storeBack!.container?.addSubview(action)
            action.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                action.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: actionPadding.width).isActive = true
            }else {
                action.leftAnchor.constraint(equalTo: alertActions[index-1].rightAnchor, constant: actionPadding.width).isActive = true
            }
            if index == alertActions.count - 1 {
                action.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -actionPadding.width).isActive = true
            }
            action.bottomAnchor.constraint(equalTo: storeBack!.container!.bottomAnchor, constant: -actionPadding.height).isActive = true
            action.widthAnchor.constraint(equalTo: alertActions.first!.widthAnchor).isActive = true
        }
    }
    
    func setupPhotoSelectionOptionConstraints() {
        storeBack?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        storeBack?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        storeBack?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0).isActive = true
        storeBack?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
        
        storeBack?.container?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.container?.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: containerPadding).isActive = true
        storeBack?.container?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: containerPadding).isActive = true
        storeBack?.container?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -containerPadding).isActive = true
        storeBack?.container?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -containerPadding).isActive = true
        storeBack?.container?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeBack?.container?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        storeBack?.container?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        alertTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertTitleLabel?.topAnchor.constraint(equalTo: storeBack!.container!.topAnchor, constant: 0).isActive = true
        alertTitleLabel?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: 0).isActive = true
        alertTitleLabel?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -0).isActive = true
        alertTitleLabel?.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        alertMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel?.topAnchor.constraint(equalTo: alertTitleLabel!.bottomAnchor, constant: 0).isActive = true
        alertMessageLabel?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: 0).isActive = true
        alertMessageLabel?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -0).isActive = true
        alertMessageLabel?.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        for (index, action) in alertActions.enumerated() {
            action.backgroundColor = .asarandom
            storeBack!.container?.addSubview(action)
            action.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                action.topAnchor.constraint(equalTo: storeBack!.container!.topAnchor, constant: actionPadding.height).isActive = true
            }else {
                action.topAnchor.constraint(equalTo: alertActions[index-1].bottomAnchor, constant: actionPadding.height).isActive = true
            }
            action.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: actionPadding.width).isActive = true
            action.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -actionPadding.width).isActive = true
            if index == alertActions.count - 1 {
                action.bottomAnchor.constraint(equalTo: storeBack!.container!.bottomAnchor, constant: -actionPadding.height).isActive = true
            }
            action.heightAnchor.constraint(equalTo: alertActions.first!.heightAnchor).isActive = true
        }
    }
    
    func setupGonzoConstraints() {
        storeBack?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        storeBack?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        storeBack?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0).isActive = true
        storeBack?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
        
        storeBack?.container?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.container?.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: containerPadding).isActive = true
        storeBack?.container?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: containerPadding).isActive = true
        storeBack?.container?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -containerPadding).isActive = true
        storeBack?.container?.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -containerPadding).isActive = true
        storeBack?.container?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storeBack?.container?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        if containerSize.height > 0 {
            storeBack?.container?.heightAnchor.constraint(equalToConstant: containerSize.height).isActive = true
        }else {
            storeBack?.container?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
     
        alertTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertTitleLabel?.topAnchor.constraint(equalTo: storeBack!.container!.topAnchor, constant: padding).isActive = true
        alertTitleLabel?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: padding).isActive = true
        alertTitleLabel?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -padding).isActive = true
        //alertTitleLabel?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        merginView?.setCurveStyle2(merginColor)
        merginView?.translatesAutoresizingMaskIntoConstraints = false
        merginView?.topAnchor.constraint(equalTo: storeBack!.container!.topAnchor, constant: 0).isActive = true
        merginView?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: 0).isActive = true
        merginView?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -0).isActive = true
        merginView?.bottomAnchor.constraint(equalTo: storeBack!.container!.bottomAnchor, constant: -buttonContainerHeight-containerPadding*2).isActive = true
        
        alertMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        alertMessageLabel?.topAnchor.constraint(equalTo: alertTitleLabel!.bottomAnchor, constant: padding).isActive = true
        alertMessageLabel?.leftAnchor.constraint(equalTo: storeBack!.container!.leftAnchor, constant: padding).isActive = true
        alertMessageLabel?.rightAnchor.constraint(equalTo: storeBack!.container!.rightAnchor, constant: -padding).isActive = true
        alertMessageLabel?.bottomAnchor.constraint(equalTo: merginView!.bottomAnchor, constant: -padding).isActive = true

        buttonContainer?.translatesAutoresizingMaskIntoConstraints = false
        let leadingAnchor = buttonContainer?.leadingAnchor.constraint(greaterThanOrEqualTo: storeBack!.container!.leadingAnchor, constant: containerPadding)
        leadingAnchor?.priority = UILayoutPriority(250)
        leadingAnchor?.isActive = true
        let trailingAnchor = buttonContainer?.trailingAnchor.constraint(lessThanOrEqualTo: storeBack!.container!.trailingAnchor, constant: -containerPadding)
        trailingAnchor?.priority = UILayoutPriority(250)
        trailingAnchor?.isActive = true
        buttonContainer?.bottomAnchor.constraint(equalTo: storeBack!.container!.bottomAnchor, constant: -containerPadding).isActive = true
        buttonContainer?.centerXAnchor.constraint(equalTo: storeBack!.container!.centerXAnchor).isActive = true
        buttonContainer?.heightAnchor.constraint(equalToConstant: CGFloat(buttonContainerHeight)).isActive = true
        
        for (index, action) in alertActions.enumerated() {
            buttonContainer?.addSubview(action)
            action.backgroundColor = action.backColor
            action.setCurveStyle1()
            action.translatesAutoresizingMaskIntoConstraints = false
            action.topAnchor.constraint(equalTo: buttonContainer!.topAnchor, constant: 0).isActive = true
            if index == 0 {
                action.leftAnchor.constraint(equalTo: buttonContainer!.leftAnchor, constant: actionPadding.width).isActive = true
            }else {
                action.leftAnchor.constraint(equalTo: alertActions[index-1].rightAnchor, constant: actionPadding.width).isActive = true
            }
            if index == alertActions.count - 1 {
                action.rightAnchor.constraint(equalTo: buttonContainer!.rightAnchor, constant: -actionPadding.width).isActive = true
            }
            action.bottomAnchor.constraint(equalTo: buttonContainer!.bottomAnchor, constant: -actionPadding.height).isActive = true
            if let buttonWidth = action.buttonWidth {
                action.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            }else {
                action.widthAnchor.constraint(equalTo: alertActions.first!.widthAnchor).isActive = true
            }
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
