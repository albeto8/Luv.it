//
//  Brand.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation

class Brand {
    
    private var _id: String!
    private var _name: String!
    //private var _logoImageUrlThumbnail: String?
    private var _profileImageUrl: String!
    private var _lastModifiedDateTime: String!
    private var _thumbnailUrl: String!
    private var _logoImageUrl: String!
    
    var id: String {
        return _id
    }
    
    var name: String {
        return _name
    }
    
    /*
    var logoImageUrlThumbnail: String? {
        
        if _logoImageUrlThumbnail == nil {
            return ""
        }
        return _logoImageUrlThumbnail
    }
 */
    
    var profileImageUrl: String {
        return _profileImageUrl
    }
    
    var lastModifiedDateTime: String {
        return _lastModifiedDateTime
    }
    
    var thumbnailUrl: String {
        return _thumbnailUrl
    }
    
    var logoImageUrl: String {
        return _logoImageUrl
    }
    
    init?(brandDictionary: Dictionary<String, Any>) {
        
        guard let id = brandDictionary["brand_id"] as? String,
            let name = brandDictionary["name"] as? String,
            //let logoImageUrlThumbnail =  brandDictionary["logo_image_url_thumbnail"] as? String?,
            let profileImageUrl = brandDictionary["profile_image_url"] as? String,
            let lastModifiedDateTime = brandDictionary["last_modified_datetime_utc"] as? String,
            let thumbnailUrl = brandDictionary["thumbnail_url"] as? String,
            let logoImageUrl = brandDictionary["logo_image_url"] as? String
            
            else { print("Error parsing brand json"); return nil }
        
        self._id = id
        self._name =  name
        //self._logoImageUrlThumbnail = logoImageUrlThumbnail
        self._profileImageUrl = profileImageUrl
        self._lastModifiedDateTime = lastModifiedDateTime
        self._thumbnailUrl = thumbnailUrl
        self._logoImageUrl = logoImageUrl
        
    }
}
