//
//  Post.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation

class Post {
    
    private var _id: String!
    private var _activeFlag: Bool!
    private var _repostCount: Int!
    private var _product: Product!
    private var _brand: Brand!
    private var _luvFlag: Bool!
    private var _creationDateTime: String!
    private var _originalFlag: Bool!
    private var _luvsCount: Int!
    private var _repostFlag: Bool!
    private var _visibleFlag: Bool!
    private var _user: User!
    
    var id: String {
        return _id
    }
    
    var activeFlag: Bool {
        return _activeFlag
    }
    
    var repostCount: Int {
        return _repostCount
    }
    
    var product: Product {
        return _product
    }
    
    var brand: Brand {
        return _brand
    }
    
    var luvFlag: Bool {
        return _luvFlag
    }
    
    var creationDateTime: String {
        return _creationDateTime
    }
    
    var originalFlag: Bool {
        return _originalFlag
    }
    
    var luvsCount: Int {
        return _luvsCount
    }
    
    var repostFlag: Bool {
        return _repostFlag
    }
    
    var visibleFlag: Bool {
        return _visibleFlag
    }
    
    var user: User {
        return _user
    }
    
    init?(postDictionary: Dictionary <String, Any>) {
        
        guard let id = postDictionary["post_id"] as? String,
            let activeFlag = postDictionary["active_flag"] as? Bool,
            let repostCount = postDictionary["reposts_count"] as? Int,
            let productDictionary = postDictionary["product"] as? Dictionary<String, Any>,
            let brandDictionary = postDictionary["brand"] as?  Dictionary<String, Any>,
            let luvFlag = postDictionary["luv_flag"] as? Bool,
            let creationDateTime = postDictionary["creation_datetime_utc"] as? String,
            let originalFlag = postDictionary["original_flag"] as? Bool,
            let luvsCount = postDictionary["luvs_count"] as? Int,
            let repostFlag = postDictionary["repost_flag"] as? Bool,
            let visibleFlag = postDictionary["visible_flag"] as? Bool,
            let userDictionary = postDictionary["user"] as? Dictionary<String, Any>
            
            else { print("Error parsing post json"); return nil }
        
        let brand = Brand(brandDictionary: brandDictionary)
        let product = Product(productDictionary: productDictionary)
        let user = User(userDictionary: userDictionary)
        
        self._id = id
        self._activeFlag = activeFlag
        self._repostCount = repostCount
        self._product = product
        self._brand = brand
        self._luvFlag = luvFlag
        self._creationDateTime = creationDateTime
        self._originalFlag = originalFlag
        self._luvsCount = luvsCount
        self._repostFlag = repostFlag
        self._visibleFlag = visibleFlag
        self._user = user
    }
    
}
