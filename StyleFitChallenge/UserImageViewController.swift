//
//  UserImageViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/21/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class UserImageViewController: UIViewController {
    
    // MARK: PROPERTIES
    var userImageView: UserImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create view
        userImageView = UserImageView(frame: view.frame)
        
        self.view.addSubview(userImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
