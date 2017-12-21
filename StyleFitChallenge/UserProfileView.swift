//
//  UserProfileView.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/20/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class UserProfileView: UIView {

    var avatarImageView: UIImageView!
    var nameLabel: UILabel!
    var imageCollectionView: UICollectionView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // set up view properties
        self.backgroundColor = UIColor.white
        
        // Create UI Elements
        
        // profile avatar image
        avatarImageView = UIImageView(image: #imageLiteral(resourceName: "default_avatar"))
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(avatarImageView)
        
        if #available(iOS 11, *) {
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        } else {
            avatarImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20).isActive = true // offset by 20 for notification bar. SafeArea only available in IB
        }
        avatarImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        
        // user's name
        nameLabel = UILabel()
        nameLabel.text = "..."
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(nameLabel)
        
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0).isActive = true
        
        // user's images Collection view
        let collectionTop = avatarImageView.frame.maxY
        let collectionFrame = CGRect(x: frame.minX + 8, y: collectionTop, width: frame.width - 16, height: frame.height - avatarImageView.frame.height - 8)
        let cellWidth = (collectionFrame.width - (8 * 4))/3 - 3
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)

        
        imageCollectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.backgroundColor = UIColor.lightGray
        
        self.addSubview(imageCollectionView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
