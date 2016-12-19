//
//  User.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation

class User {
    
    private var _id: String!
    private var _username: String!
    private var _name: String!
    private var _andCount: Int!
    private var _profileImageURL: String!
    private var _names: [String]!
    
    init(id: String, username: String, name: String, andCount: Int, profileImageURL: String, names: [String]) {
        
        self._id = id
        self._username = username
        self._name = name
        self._andCount = andCount
        self._profileImageURL = profileImageURL
        self._names = names
    }
    
    init(userDictionary: Dictionary<String, Any>) {
        
    }
    
}
