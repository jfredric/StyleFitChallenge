//
//  LoginViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up view properties
        view.backgroundColor = UIColor.white
        
        // Create the UI Elements
        let margins = view.layoutMarginsGuide
        
        var uiArray: [UIView] = []
        
        let titleLabel = UILabel()
        titleLabel.text = "Let's get logged in!"
        titleLabel.textAlignment = .center
        uiArray.append(titleLabel)
        
        // Create email username textfield
        emailTextField.delegate = self // set delgate for keyboard handling
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "email address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        uiArray.append(emailTextField)
        
        // Create password text field
        passwordTextField.delegate = self // set delgate for keyboard handling
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "enter password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .continue
        uiArray.append(passwordTextField)
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        uiArray.append(loginButton)
        
        // Create the stack view to hold the buttons
        let stackView = UIStackView(arrangedSubviews: uiArray)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        // set autolayout constraints
        // center stackView
        //stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let sideSpacing: CGFloat = 20
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: sideSpacing).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -sideSpacing).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // MARK: TEXTFIELD DELEGATE FUNCTIONS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField{
            textField.resignFirstResponder()
            // login in here if we want
        }
        return true
    }
    
    // MARK: ACTION FUNCTIONS
    
    @objc func loginButtonAction(sender: UIButton!) {
        print("login button tapped")
        // login...
        
        //performSegue(withIdentifier: loginSegueID, sender: nil)
    }

}
