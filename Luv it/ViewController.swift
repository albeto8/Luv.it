//
//  ViewController.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var page = 1
    var isNewDataLoading = false
    
    var postArray = [Post]()
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    var contentView: MainView {
        return view as! MainView
    }
    
    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        
        self.navigationItem.title = "Luv it"
        
        downloadFromApi(page: self.page) {
            self.contentView.tableView.reloadData()
            for post in self.postArray {
                print("Post: productName: \(post.product.name) brandName: \(post.brand.name) \n")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 384
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = postArray[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell {
            
            if let image = ViewController.imageCache.object(forKey: post.product.imageGalleryUrls[0] as NSString) {
                cell.configureCell(post: post, image: image)
            } else {
                cell.configureCell(post: post)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func downloadFromApi(page: Int, completed: @escaping DownloadComplete) {
        
        let parameters: Parameters = ["page": page]
        
        Alamofire.request(BASE_URL, method: .post, parameters: parameters).responseJSON { (response) in
            
            if let dictionary = response.result.value as? Dictionary <String, Any>, dictionary["status"] as? String == "OK", let chunk = dictionary["chunk"] as? [Dictionary <String, Any>] {
                
                for item in chunk {
                    
                    if let post = Post(postDictionary: item) {
                        self.postArray.append(post)
                    }
                }
                self.page = self.page + 1
            }
            completed()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //Bottom Refresh
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
            if !isNewDataLoading {
                isNewDataLoading = true
                print("BOTOMM \(page)")
                self.downloadFromApi(page: self.page) {
                    self.contentView.tableView.reloadData()
                    self.isNewDataLoading = false
                }
            }
        }
    }

}

