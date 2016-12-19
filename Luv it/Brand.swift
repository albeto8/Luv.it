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
    private var _logoImageUrlThumbnail: String!
    private var _profileImageUrl: String!
    private var _lastModifiedDateTime: String!
    private var _thumbnailUrl: String!
    private var _logoImageUrl: String!
    
    init(id: String, name: String, logoImageUrlThumbnail: String, profileImageUrl: String, lastModifiedDateTime: String, thumbnailUrl: String, logoImageUrl: String!) {
        
    }
    
    init(brandDictionary: Dictionary<String, Any>) {
        
    }
}
