//
//  LoginViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: PROPERTIES
    var loginView: LoginView!
    
    // MARK: UIVIEWCONTROLLER
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create view
        loginView = LoginView(frame: view.frame)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        loginView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        // create tap recognizer to clear keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedAnywhereAction))
        //tap.delegate =
        view.addGestureRecognizer(tap)
        
        // set the delegates
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        
        self.view.addSubview(loginView)
    }
    
    // MARK: TEXTFIELD DELEGATE FUNCTIONS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginView.emailTextField {
            loginView.passwordTextField.becomeFirstResponder()
        }
        if textField == loginView.passwordTextField{
            textField.resignFirstResponder()
            // login in here if we want
        }
        return true
    }
    
    // MARK: ACTION FUNCTIONS
    
    @objc func tappedAnywhereAction(sender: UITapGestureRecognizer!) {
        // Dismiss keyboard
        view.endEditing(true)
    }
    
    @objc func loginButtonAction(sender: UIButton!) {
        print("login button tapped")
        
        Auth.auth().signIn(withEmail: loginView.emailTextField.text!, password: loginView.passwordTextField.text!) { user, error in
            if error == nil {
                print("Sign in successful")
                self.loginView.passwordTextField.text = ""
                let userInfo = UserInfo(firebaseUser: user!)
                userInfo.load(completion: {
                    
                    let profileViewController = UserProfileViewController()
                    let navController = UINavigationController(rootViewController: profileViewController)
                    
                    profileViewController.currentUser = userInfo
                    
                    self.present(navController, animated: true, completion: nil)
                })
                
            } else {
                print("Login failed: \(error?.localizedDescription ?? "unknown error")")
                messageAlert(title: "Login Failure", message: error?.localizedDescription ?? "unknown error", from: self)
            }
        }
        
        
    }
    
    @objc func cancelButtonAction(sender: UIButton!) {
        print("cancel button tapped")
        
        dismiss(animated: true, completion: nil)
    }

}
