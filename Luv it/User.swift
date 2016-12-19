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
    
    var id: String {
        return _id
    }
    
    var username: String {
        return _username
    }
    
    var name: String {
        return _name
    }
    
    var andCount: Int {
        return _andCount
    }
    
    var profileImageURL: String {
        return _profileImageURL
    }
    
    var names: [String] {
        return _names
    }
    
    init?(userDictionary: Dictionary<String, Any>) {
        guard let id = userDictionary["user_id"] as? String,
        let username = userDictionary["username"] as? String,
        let name = userDictionary["name"] as? String,
        let andCount = userDictionary["and_count"] as? Int,
        let profileImageURL = userDictionary["profile_image_url"] as? String,
        let names = userDictionary["names"] as? [String]
            
        else { print("Error parsing user json"); return nil }
        
        self._id = id
        self._username = username
        self._name = name
        self._andCount = andCount
        self._profileImageURL = profileImageURL
        self._names = names
    }
    
}
