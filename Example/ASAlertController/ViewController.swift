//
//  ViewController.swift
//  ASAlertController
//
//  Created by amitpstu1@gmail.com on 11/10/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASAlertController

class ViewController: UIViewController {
    
    private var attributes = [
        ASAAttribute(value: "Your password has been locked. Please reset your password from the link of the forgot password ", type: .defaultAttr),
        ASAAttribute(value: " in the Login screen.", attrs: [.font: UIFont.systemFont(ofSize: 16, weight: .black), .foregroundColor: UIColor.lightGray] as [NSAttributedString.Key : Any]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteEvent(_ sender: Any) {
        let alert = ASAlertControllerGonzoStyle("", "Do you want to delete?")
        alert.setCornerRadious(5)
        alert.buttonContainerHeight = 40
        alert.merginColor = .gray
        alert.containerSize = CGSize(width: -1, height: 400)
        asAlertShow(alert.action("Yes", 100, .white, .green, .clear, {
            alert.dismissController()
            print("Yes")
        }).action("Cancel", 200, .white, .red, .clear, {
            alert.dismissController()
            print("Cancel")
        }))
        alert.alertTitleLabel?.text = "Alert!"
        alert.alertMessageLabel?.numberOfLines = 0
        alert.alertMessageLabel?
            .setAttributes(attributes)
            .setEvent { [weak self] (attributeLabelIndex, attributeIndex, attribute) in
                if let value = attribute.value, value == " in the Login screen." {
                    print("value: \(value)")
                    let alert = UIAlertController(title: "Alert", message: value, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }}
    }
}

