//
//  ViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // constants
    let loginSegueID = "loginSegue"
    let signUpSegueID = "signUpSegue"
    let userSegueID = "userSegue"
    let adminSegueID = "adminSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // first check oauth and move to login if logged in already
        // do that here otherwise go on
        
        
        // Create the UI Elements
        var uiArray: [UIView] = []
        
        let titleLabel = UILabel()
        titleLabel.text = "StyleFit Coding Challenge App"
        uiArray.append(titleLabel)
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("I'm a current user", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        //loginButton.layer.borderWidth = 1
        uiArray.append(loginButton)
        
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("I'm a new user", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        uiArray.append(signUpButton)
        
        
        // Create the stack view to hold the buttons
        let stackView = UIStackView(arrangedSubviews: uiArray)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        // set autolayout constraints
        // center stackView
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loginButtonAction(sender: UIButton!) {
        print("current user tapped")
        //performSegue(withIdentifier: loginSegueID, sender: nil)
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func signUpButtonAction(sender: UIButton!) {
        print("new user tapped")
        let signUpViewController = SignUpViewController()
        present(signUpViewController, animated: true, completion: nil)
    }

}

