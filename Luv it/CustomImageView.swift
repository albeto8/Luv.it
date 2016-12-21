//
//  CustomImageView.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 21/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    var imageURLString: String?
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print("Error downloading image")
                    return }
            DispatchQueue.main.async() { () -> Void in
                
                if self.imageURLString == url.absoluteString {
                    self.image = image

                }
                ViewController.imageCache.setObject(image, forKey: url.absoluteString as NSString)
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        
        imageURLString = link
        
        downloadedFrom(url: url, contentMode: mode)
    }
}
