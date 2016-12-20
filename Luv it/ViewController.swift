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
    
    let parameters: Parameters = ["page": 1]
    var postArray = [Post]()
    
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
        
        downloadFromApi{
            for post in self.postArray {
                print("Post: productName: \(post.product.name) brandName: \(post.brand.name) \n")
                self.contentView.tableView.reloadData()
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell {
            
            cell.configureCell(post: postArray[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
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

