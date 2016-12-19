//
//  Product.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation

class Product {
    
    private var _id: String!
    private var _imageProportion: String!
    private var _name: String!
    private var _salePrice: String!
    private var _price: String!
    private var _stockStatus: String!
    private var _onSale: Bool!
    private var _imageGalleryUrlsThumbnails: [String]!
    private var _imageGalleryUrls: [String]!
    
    var id: String {
        return _id
    }
    
    var imageProportion: String {
        return _imageProportion
    }
    
    var name: String {
        return _name
    }
    
    var salePrice: String {
        return _salePrice
    }
    
    var price: String {
        return _price
    }
    
    var stockStatus: String {
        return _stockStatus
    }
    
    var onSale: Bool {
        return _onSale
    }
    
    var imageGalleryUrlsThumbnails: [String] {
        return _imageGalleryUrlsThumbnails
    }
    
    var imageGalleryUrls: [String] {
        return _imageGalleryUrls
    }
    
    init?(productDictionary: Dictionary<String, Any>) {
        
        guard let id = productDictionary["product_id"] as? String,
            let imageProportion = productDictionary["image_proportion"] as? String,
            let name = productDictionary["name"] as? String,
            let salePrice = productDictionary["sale_price"] as? String,
            let price = productDictionary["price"] as? String,
            let stockStatus = productDictionary["stock_status"] as? String,
            let onSale = productDictionary["on_sale"] as? Bool,
            let imageGalleryUrlsThumbnails = productDictionary["image_gallery_urls_thumbnails"] as? [String],
            let imageGalleryUrls = productDictionary["image_gallery_urls"] as? [String]
            
            else { print("Error parsing product json"); return nil }
        
        self._id = id
        self._imageProportion = imageProportion
        self._name = name
        self._salePrice = salePrice
        self._price = price
        self._stockStatus = stockStatus
        self._onSale = onSale
        self._imageGalleryUrlsThumbnails = imageGalleryUrlsThumbnails
        self._imageGalleryUrls = imageGalleryUrls
    }
}
