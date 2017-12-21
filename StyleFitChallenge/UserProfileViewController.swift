//
//  UserProfileViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserProfileViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: PROPERTIES
    var userProfileView: UserProfileView!
    var currentUser: UserInfo!

    override func viewDidLoad() {
        super.viewDidLoad()
        // update view controller
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear

        // create view
        userProfileView = UserProfileView(frame: view.frame)
        view.addSubview(userProfileView)
        
        // add logout button
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutButtonAction))
        navigationItem.rightBarButtonItem = logoutButton
        
        // set delegates
        userProfileView.imageCollectionView.delegate = self
        userProfileView.imageCollectionView.dataSource = self
        
        // register collection view cell
        userProfileView.imageCollectionView.register(UserImageCollectionViewCell.self, forCellWithReuseIdentifier: UserImageCollectionViewCell.cellReuseIdentifier)
        
        // Set view content
        userProfileView.nameLabel.text = currentUser.name
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
    
    // MARK: COLLECTIONVIEW DATA SOURCE DELEGATE
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // test value
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserImageCollectionViewCell.cellReuseIdentifier, for: indexPath) as! UserImageCollectionViewCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userImageViewController = UserImageViewController()
        // set info here
        navigationController?.pushViewController(userImageViewController, animated: true)
        //present(userImageViewController, animated: true, completion: nil)
    }

}
