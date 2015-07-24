//
//  ViewController.swift
//  MYOA
//
//  Created by Phuc Nguyen on 7/24/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: UIBarButtonItemStyle.Plain, target: self, action: "startOver")
    }

    func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
    
    deinit {
        println("ViewController deallocated")
    }
}

