//
//  AppDatabase.swift
//  StyleFitChallenge
//
//  Created by Joshua Fredrickson on 12/21/17.
//  Copyright © 2017 Joshua Fredrickson. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class AppDatabase {
    
    // Root references into firebase
    static let rootRef = Database.database().reference()
    static let userInfoRootRef = rootRef.child("user-info")
    static let adminListRef = rootRef.child("admin-list")
    static let userImagesRootRef = rootRef.child("user-images")
    static let commentsRootRef = rootRef.child("comments")
}
