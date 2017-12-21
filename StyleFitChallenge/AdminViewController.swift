//
//  AdminViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/21/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit
import FirebaseAuth

class AdminViewController: UIViewController {

    // MARK: PROPERTIES
    var adminView: AdminView!
    var currentUser: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // update view controller
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        // create view
        adminView = AdminView(frame: view.frame)
        view.addSubview(adminView)
        
        // add logout button
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutButtonAction))
        navigationItem.rightBarButtonItem = logoutButton

        
        // Set view content
        adminView.nameLabel.text = currentUser.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ACTION FUCTIONS
    @objc func logoutButtonAction(sender: UIBarButtonItem!) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
            print("Log [UserProfile]: Logged out.")
            // load for guest
        } catch let signOutError {
            print ("Error [UserProfile]: Log Out: %@", signOutError)
        }
    }
    
}
