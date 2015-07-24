//
//  ViewController.swift
//  ImagePickerExperiment
//
//  Created by Phuc Nguyen on 7/24/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
UITextFieldDelegate {
    
    //MARK: PROPERTIES AND OUTLETS
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem! {
        didSet {
            cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        }
    }
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: 3.0
    ]
   
    //MARK: IMAGE PICKER CONTROLLER DELEGATE METHODS
    @IBAction func pickImage(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pickImageFromCamera(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: TEXT FIELD DELEGATE METHODS
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
        return true
        
    }
    
    
   
    //MARK: VIEW LIFE CYCLE
    override func viewWillAppear(animated: Bool) {
        topTextField?.defaultTextAttributes = memeTextAttributes
        bottomTextField?.defaultTextAttributes = memeTextAttributes
    }
}

