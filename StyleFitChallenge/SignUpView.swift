//
//  SignUpView.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    var nameTextField: UITextField = UITextField()
    var emailTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var confirmPasswordTextField: UITextField = UITextField()
    var errorLabel: UILabel = UILabel()
    let signUpButton = UIButton(type: .system)
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
        
        //text fields and create button
        var uiArray: [UIView] = []
        
        // error label
        errorLabel.textColor = UIColor.red
        errorLabel.textAlignment = .center
        uiArray.append(errorLabel)
        
        // Set name textfield properties
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "name"
        nameTextField.keyboardType = .emailAddress
        nameTextField.returnKeyType = .next
        uiArray.append(nameTextField)
        
        // Set email/username textfield properties
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "email address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        uiArray.append(emailTextField)
        
        // set password text field properties
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "enter password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .next
        uiArray.append(passwordTextField)
        
        // set password text field properties
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.placeholder = "confirm password"
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.returnKeyType = .continue
        uiArray.append(confirmPasswordTextField)
        
        // set create button properties
        signUpButton.setTitle("Sign Up", for: .normal)
        uiArray.append(signUpButton)
        
        // Create the stack view to hold the buttons
        let stackView = UIStackView(arrangedSubviews: uiArray)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        // set autolayout constraints for StackView
        // center
        let sideSpacing: CGFloat = 20
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: sideSpacing).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -sideSpacing).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

}
