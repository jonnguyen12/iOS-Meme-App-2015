//
//  CashTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Phuc Nguyen on 7/23/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var oldText = textField.text as NSString
        var newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
                
            }
        }
        
        if let numOfPennies = digitText.toInt() {
            newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + centsStringFromInt(numOfPennies)
            
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func dollarStringFromInt(value: Int) -> String {
        return String(value / 100)
    }
    
    func centsStringFromInt(value: Int) -> String {
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }
}