//
//  DetailVC.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 20/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var post: Post?
    var postImage: UIImage?
    
    var detailView: DetailView {
        return view as! DetailView
    }
    
    override func loadView() {
        view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Product Details"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        if let currentPost = post {
            detailView.configureUI(post: currentPost, image: postImage)
        }
    }

}
