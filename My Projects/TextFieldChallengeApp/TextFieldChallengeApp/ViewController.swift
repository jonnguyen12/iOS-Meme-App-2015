//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Phuc Nguyen on 7/23/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var lockableTextField: UITextField!
    
    //MARK: Properties
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipcodeTextField.delegate = zipCodeDelegate
        cashTextField.delegate = cashDelegate
        lockableTextField.delegate = self
        
        switcher.setOn(false, animated: false)
    }
    
    //MARK: Text field delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        lockableTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return switcher.on
    }
    
    @IBAction func toggleTextEditing(sender: UISwitch) {
        if !sender.on {
            lockableTextField.resignFirstResponder()
        }
    }
    
}

