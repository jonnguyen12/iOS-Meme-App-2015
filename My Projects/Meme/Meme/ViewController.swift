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
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton! {
        didSet {
            cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        }
    }
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: 3.0,
        NSForegroundColorAttributeName: UIColor.whiteColor()
    ]
    
    var meme: Meme! {
        didSet {
            shareButton.enabled = true
        }
    }
    
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
        
        if imageView.image != nil {
             meme = Meme(topText: topTextField.text, bottomText: bottomTextField.text, originalImage: imageView.image!, memedImage: generateMemedImage())
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if topTextField.editing {
            topTextField.text = ""
        } else if bottomTextField.editing {
            bottomTextField.text = ""
        }
    }
    
   
    //MARK: VIEW LIFE CYCLE
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = .Center
        bottomTextField.textAlignment = .Center
        shareButton.enabled = false
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
    }
    
    //MARK: NOTIFICATIONS
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: SHIFT VIEW's FRAME for KEYBOARD
    func keyboardWillShow(notification: NSNotification) {
        if bottomTextField.editing {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if bottomTextField.editing {
            view.frame.origin.y += getKeyboardHeight(notification)
        }
    }
    
    //MARK: COMBINING TEXT AND IMAGE
    func generateMemedImage() -> UIImage{
        //Hide toolbar and navbar
        toolbar.hidden = true
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
        
        //render view to an image
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        //Show toolbar and navbar
        toolbar.hidden = false
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)

        return memedImage

    }
    
    //MARK: SHARING
    
    @IBAction func share(sender: UIButton) {
        let memedImage = generateMemedImage()
        let avc = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        presentViewController(avc, animated: true, completion: nil)
        avc.completionWithItemsHandler = {(_ ,completed: Bool, _ , _) in
            if completed {
                self.save()
                avc.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("showSentMemes", sender: self)
            }
        }
    }
    
    func save() {
        //create meme
        
        meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: generateMemedImage())
        
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    //MARK: SEGUE
    
   
    @IBAction func cancel(sender: UIBarButtonItem) {
        save()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tvc = segue.destinationViewController as? UITabBarController {
            if let tvc = tvc.selectedViewController as? SentMemeTableViewController {
                tvc.memes.append(meme)
            } else if let cvc = tvc.selectedViewController as? SentMemeCollectionViewController {
                cvc.memes.append(meme)
            }
        }
    }
    
}

