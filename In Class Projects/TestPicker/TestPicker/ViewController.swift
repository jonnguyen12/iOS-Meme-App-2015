//
//  ViewController.swift
//  TestPicker
//
//  Created by Phuc Nguyen on 7/20/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func experiment(sender: UIButton) {
//        let image = UIImage()
//        let nextVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
//        presentViewController(nextVC, animated: true, completion: nil)
        
        let controller = UIAlertController(title: "Test Alert", message: "This is a test", preferredStyle: .Alert)
        
        //dismiss the view controller after the user taps "ok"
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        controller.addAction(okAction)
        presentViewController(controller, animated: true, completion: nil)
        
        
    }
}

