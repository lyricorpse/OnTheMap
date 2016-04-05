//
//  PutNewPinViewController.swift
//  OnTheMap
//
//  Created by Feng Zhu on 4/5/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit

class PutNewPinViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var findOnTheMapButton: UIButton!
    @IBOutlet weak var enterLocationTextField: UITextField!
    
    var isFirstEdit: Bool!
    
    @IBAction func cancelButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        isFirstEdit = true
        UIconfig()
    }
    
    func UIconfig() {
        // button round corner
        findOnTheMapButton.layer.cornerRadius = 10.0
        findOnTheMapButton.clipsToBounds = true
        
        // textfield
        let locationTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor()
        ]
        enterLocationTextField.defaultTextAttributes = locationTextAttributes
        
        enterLocationTextField.text = "Enter Your Location Here"
        enterLocationTextField.contentVerticalAlignment = .Top
        enterLocationTextField.textAlignment = .Center
        enterLocationTextField.delegate = self
    }
    
    // MARK: Hide/Show Keyboard
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if isFirstEdit! {
            enterLocationTextField.text = ""
            isFirstEdit = false
        }
        enterLocationTextField.textAlignment = .Left
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        enterLocationTextField.textAlignment = .Center
        view.endEditing(true)
    }
    

}
