//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Feng Zhu on 4/5/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        UIConfig()
    }
    
    func UIConfig() {
        // button round corner
        loginButton.layer.cornerRadius = 5.0
        loginButton.clipsToBounds = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: Hide/Show Keyboard
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
//        linkInputTextField.textAlignment = .Center
        view.endEditing(true)
    }
}
