//
//  UserProfileViewController.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: PROPERTIES
    var userProfileView: UserProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // create view
        userProfileView = UserProfileView(frame: view.frame)
        view.addSubview(userProfileView)
        
        // set delegates
        userProfileView.imageCollectionView.delegate = self
        userProfileView.imageCollectionView.dataSource = self
        
        // register collection view cell
        userProfileView.imageCollectionView.register(UserImageCollectionViewCell.self, forCellWithReuseIdentifier: UserImageCollectionViewCell.cellReuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        present(userImageViewController, animated: true, completion: nil)
    }

}
