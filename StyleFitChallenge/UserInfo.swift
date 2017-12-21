//
//  UserInfo.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/21/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import Foundation
import Firebase

class UserInfo {
    
    // MARK: PROPERTIES
    var name: String = ""
    var email: String = ""
    var profileAvatarImageID: String?
    var imageIDs: [String] = []
    var isAdmin: Bool = false
    
    var profileAvatarUIImage: UIImage?
    var images: [UIImage?] = []
    
    var userInfoRef: DatabaseReference
    
    struct FirebaseKeys {
        static let name = "name"
        static let email = "email"
        static let avatarID = "avatarID"
        static let imageIDs = "imageIDs"
        static let isAdmin = "isAdmin"
    }
    
    init(firebaseUser: User) {
        
        // set the database reference for the user
        userInfoRef = AppDatabase.userInfoRootRef.child(firebaseUser.uid)

    }
    
    func load(completion: @escaping ()->Void) {

        // load data
        userInfoRef.observeSingleEvent(of: .value) { (snapshot) in
            let newUserInfo = snapshot.value as! [String:Any]
            self.name = newUserInfo[FirebaseKeys.name] as? String ?? ""
            self.email = newUserInfo[FirebaseKeys.email] as? String ?? ""
            self.profileAvatarImageID = newUserInfo[FirebaseKeys.avatarID] as? String
            self.imageIDs = newUserInfo[FirebaseKeys.imageIDs] as? [String] ?? []
            self.isAdmin = newUserInfo[FirebaseKeys.isAdmin] as? Bool ?? false
            
            // begin loading images
            
            completion()
        }
    }
    
    init(name: String, email: String, isAdmin: Bool, firebaseUser: User) {
        self.name = name
        self.email = email
        self.isAdmin = isAdmin
        
        userInfoRef = AppDatabase.userInfoRootRef.child(firebaseUser.uid)
        
        // write to firebase
        userInfoRef.setValue(toAnyObject())
    }
    
    func toAnyObject() -> Any {
        return [
            FirebaseKeys.name : name,
            FirebaseKeys.email : email,
            FirebaseKeys.avatarID : profileAvatarImageID,
            FirebaseKeys.imageIDs : imageIDs,
            FirebaseKeys.isAdmin : isAdmin
        ]
    }
    
}
