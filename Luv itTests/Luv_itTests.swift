//
//  Luv_itTests.swift
//  Luv itTests
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import XCTest
@testable import Luv_it

class Luv_itTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSON() {
        
        let brandData: Dictionary <String, Any> = ["name": "PX", "logo_image_url_thumbnail": "test",
                                              "profile_image_url": "test", "last_modified_datetime_utc": "test", "brand_id": "hdhdhd", "thumbnail_url": "shhd", "logo_image_url": "gdgdg"]
        
        let productData: Dictionary <String, Any> = ["image_proportion": "vertical",
            "product_id":"038935ad-4005-4928-be7a-c4c9ac101c54",
            "name":"Andres Jacket",
            "sale_price":"0.00",
            "price":"90.00",
            "stock_status":"low stock",
            "on_sale": false,
            "image_gallery_urls_thumbnails": ["https://cdn.shopify.com/s/files/1/0105/4102/products/7PJ6339M-ARMY_LoRes_3f51174c-2adf-4e12-9a70-3bc921b02170.jpg?v=1471045343", " "],
            "image_gallery_urls": ["https://cdn.shopify.com/s/files/1/0105/4102/products/7PJ6339M-ARMY_LoRes_3f51174c-2adf-4e12-9a70-3bc921b02170.jpg?v=1471045343", " "]
        ]
        
        let userData : Dictionary <String, Any> = ["username":"juanmanuel_cs",
        "user_id":"9c1630b1-0622-426d-9531-d6dc89517c78",
        "name":"Juan Manuel",
        "and_count":0,
        "profile_image_url":"https://scontent.xx.fbcdn.net/v/t1.0-1/p320x320/12346396_10154333784568765_1368679928623594932_n.jpg?oh=f771a7ab30c2bf6db058a405c8a7e8a4&oe=5844FC05",
        "names":["Mario", "Alberto"]]
        
        let postData: Dictionary <String, Any> = ["active_flag": true, "reposts_count": 1, "product": productData, "brand": brandData, "luv_flag": false, "post_id": "d795f407-9068-4af9-af1b-46a61e25b2f7", "user": userData, "creation_datetime_utc": "2016-10-24T05:37:54.732383Z", "original_flag": false, "luvs_count": 1 , "repost_flag":false, "visible_flag":true]
        
        XCTAssertNotNil(Product(productDictionary: productData))
        XCTAssertNotNil(Brand(brandDictionary: brandData))
        XCTAssertNotNil(Post(postDictionary: postData))
    }
    
}
