//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Phuc Nguyen on 7/23/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit
import Foundation

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        return newText.length <= 5
    }
}
