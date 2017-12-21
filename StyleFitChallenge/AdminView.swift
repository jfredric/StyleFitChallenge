//
//  AdminView.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/21/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class AdminView: UIView {

    var avatarImageView: UIImageView!
    var nameLabel: UILabel!
    var tableView: UITableView!
    
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
        
        // list of users - tableview
        let tableViewTop = avatarImageView.frame.maxY
        let tableViewHeight = frame.height - avatarImageView.frame.height
        let tableViewFrame = CGRect(x: frame.minX, y: tableViewTop, width: frame.width, height: tableViewHeight)
        tableView = UITableView(frame: tableViewFrame, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
        tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        tableView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor)
        //tableView.bottomAnchor.constraint(equalTo: frame.maxY)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
