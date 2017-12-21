//
//  UserImageView.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/21/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import UIKit

class UserImageView: UIView {

    var imageView: UIImageView!
    var tableView: UITableView!
    var textField: UITextField!
    var addCommentButton: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        // set up view properties
        self.backgroundColor = UIColor.white
        
        // Create UI Elements
        
        // profile avatar image
        imageView = UIImageView(image: #imageLiteral(resourceName: "default_image"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        
        if #available(iOS 11, *) {
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        } else {
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20).isActive = true // offset by 20 for notification bar. SafeArea only available in IB
        }
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        // add button
        addCommentButton = UIButton(type: .system)
        addCommentButton.setTitle("Add", for: .normal)
        addCommentButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(addCommentButton)
        
        addCommentButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        addCommentButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        
        // comment textfield
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "enter comment"
        textField.keyboardType = .default
        textField.returnKeyType = .send
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        
        textField.leadingAnchor.constraint(equalTo: addCommentButton.trailingAnchor, constant: 8).isActive = true
        textField.bottomAnchor.constraint(equalTo: addCommentButton.bottomAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
