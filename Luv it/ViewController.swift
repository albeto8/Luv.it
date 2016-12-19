//
//  ViewController.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let parameters: Parameters = ["page": 1]
    var postArray = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadFromApi{
            for post in self.postArray {
                print("Post: productName: \(post.product.name) brandName: \(post.brand.name) \n")
            }
        }
    }
    
    func downloadFromApi(completed: @escaping DownloadComplete) {
        Alamofire.request(BASE_URL, method: .post, parameters: parameters).responseJSON { (response) in
            
            if let dictionary = response.result.value as? Dictionary <String, Any>, let chunk = dictionary["chunk"] as? [Dictionary <String, Any>]{
                
                for item in chunk {
                    
                    if let post = Post(postDictionary: item) {
                        self.postArray.append(post)
                    }
                }
            }
            completed()
        }
    }

}

