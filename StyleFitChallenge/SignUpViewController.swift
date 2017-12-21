//
//  SignUpViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // MARK: PROPERTIES
    var signUpView: SignUpView!
    
    // MARK: UIVIEWCONTROLLER
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create view
        signUpView = SignUpView(frame: view.frame)
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        signUpView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        // create tap recognizer to clear keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedAnywhereAction))
        //tap.delegate =
        view.addGestureRecognizer(tap)
        
        // set the delegates
        signUpView.nameTextField.delegate = self
        signUpView.emailTextField.delegate = self
        signUpView.passwordTextField.delegate = self
        signUpView.confirmPasswordTextField.delegate = self
        
        self.view.addSubview(signUpView)
    }
    
    // MARK: TEXTFIELD DELEGATE FUNCTIONS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case signUpView.nameTextField :
            signUpView.emailTextField.becomeFirstResponder()
        case signUpView.emailTextField :
            signUpView.passwordTextField.becomeFirstResponder()
        case signUpView.passwordTextField :
            signUpView.confirmPasswordTextField.becomeFirstResponder()
        case signUpView.confirmPasswordTextField :
            textField.resignFirstResponder()
        default :
            textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: ACTION FUNCTIONS
    
    @objc func tappedAnywhereAction(sender: UITapGestureRecognizer!) {
        // Dismiss keyboard
        view.endEditing(true)
    }
    
    @objc func signUpButtonAction(sender: UIButton!) {
        print("sign up button tapped")
        if signUpView.nameTextField.text == "" {
            signUpView.errorLabel.text = "missing name"
        } else if signUpView.emailTextField.text == "" {
            signUpView.errorLabel.text = "missing email"
        } else if signUpView.passwordTextField.text == "" {
            signUpView.errorLabel.text = "enter a password"
        } else if signUpView.confirmPasswordTextField.text == "" {
            signUpView.errorLabel.text = "confirm password"
        } else if signUpView.passwordTextField.text != signUpView.confirmPasswordTextField.text {
            signUpView.errorLabel.text = "password does not match"
        } else {
            signUpView.errorLabel.text = ""
            // segue, etc
        }
    }
    
    @objc func cancelButtonAction(sender: UIButton!) {
        print("cancel button tapped")
        
        dismiss(animated: true, completion: nil)
    }
    
}
