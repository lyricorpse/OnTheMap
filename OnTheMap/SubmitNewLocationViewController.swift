//
//  SubmitNewLocationViewController.swift
//  OnTheMap
//
//  Created by Feng Zhu on 4/5/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit
import MapKit

class SubmitNewLocationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var linkInputTextField: UITextField!
    
    var isEditted: Bool!
    
    @IBAction func cancelButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func submitLocation(sender: UIButton) {
        if isEditted! {
            print("Submitting the new location \(linkInputTextField.text)...")
        } else {
            print("Must Enter a Link")
        }
    }
    
    var isFirstEdit: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        isEditted = false
        UIConfig()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        isFirstEdit = true
    }

    func UIConfig() {
        // button round corner
        submitButton.layer.cornerRadius = 10.0
        submitButton.clipsToBounds = true
        
        // textfield
        let locationTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name:"Helvetica Neue", size: 22)!
        ]
        linkInputTextField.defaultTextAttributes = locationTextAttributes
        
        linkInputTextField.text = "Enter A Link to Share Here"
        linkInputTextField.contentVerticalAlignment = .Top
        linkInputTextField.textAlignment = .Center
        linkInputTextField.delegate = self
    }
    
    
    // MARK: Hide/Show Keyboard
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if isFirstEdit! {
            linkInputTextField.text = ""
            isFirstEdit = false
        }
        linkInputTextField.textAlignment = .Left
        isEditted = true
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
        linkInputTextField.textAlignment = .Center
        view.endEditing(true)
    }

}
