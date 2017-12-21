//
//  LoginView.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class LoginView: UIView {

    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    let loginButton = UIButton(type: .system)
    let cancelButton = UIButton(type: .system)
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // set up view properties
        self.backgroundColor = UIColor.white
        
        // Create the UI Elements
        let margins = self.layoutMarginsGuide
        
        // cancel button
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cancelButton)
        
        cancelButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -8).isActive = true
        
        // login text fields and button
        
        var uiArray: [UIView] = []
        
        let titleLabel = UILabel()
        titleLabel.text = "Let's get logged in!"
        titleLabel.textAlignment = .center
        uiArray.append(titleLabel)
        
        // Set email username textfield properties
        //emailTextField.delegate = self // set delgate for keyboard handling
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "email address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        uiArray.append(emailTextField)
        
        // set password text field properties
        //passwordTextField.delegate = self // set delgate for keyboard handling
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "enter password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .continue
        uiArray.append(passwordTextField)
        
        // set login button properties
        loginButton.setTitle("Login", for: .normal)
        uiArray.append(loginButton)
        
        // Create the stack view to hold the buttons
        let stackView = UIStackView(arrangedSubviews: uiArray)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        // set autolayout constraints
        
        // center stackView
        let sideSpacing: CGFloat = 20
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: sideSpacing).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -sideSpacing).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
