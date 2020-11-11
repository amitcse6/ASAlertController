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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteEvent(_ sender: Any) {
        alertShow(ASAlertControllerClassic("Alert!", "Do you want to delete?").action("Cancel", {
            print("cancel...")
        }).action("Yes", {
            print("yes...")
        }))
    }
}

