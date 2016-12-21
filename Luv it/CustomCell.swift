//
//  CustomCell.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 20/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var view = UIView()
    var heartButton = UIButton()
    var repostButton = UIButton()
    var productImageView = CustomImageView()
    var stockLabel = UILabel()
    var lineView = UIView()
    var productNameLabel = UILabel()
    var priceLabel = UILabel()
    var salePriceLabel = UILabel()
    var numberLikesButton = UIButton()
    var numberRepostsButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initializeUI()
        createConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func initializeUI() {
        
        heartButton.addTarget(self, action: #selector(self.luvTapped), for: .touchUpInside)
        repostButton.addTarget(self, action: #selector(self.repostTapped), for: .touchUpInside)
        
        contentView.addSubview(view)
        
        view.addSubview(heartButton)
        view.addSubview(repostButton)
        
        view.addSubview(productImageView)
        view.addSubview(stockLabel)
        view.addSubview(lineView)
        view.addSubview(productNameLabel)
        
        view.addSubview(priceLabel)
        view.addSubview(salePriceLabel)
        
        view.addSubview(numberLikesButton)
        view.addSubview(numberRepostsButton)
        
    }
    
    func configureCell(post: Post, image: UIImage? = nil) {
        
        if image == nil {
            productImageView.downloadedFrom(link: post.product.imageGalleryUrls[0])
            print("Downloaded image")
        } else {
            print("Cached image")
            productImageView.image = image
        }
        
        if post.luvFlag {
            heartButton.setBackgroundImage(UIImage(named: "heartitemenabled"), for: .normal)
        } else {
            heartButton.setBackgroundImage(UIImage(named: "heartitem"), for: .normal)
        }
        
        if post.repostFlag {
            repostButton.setBackgroundImage(UIImage(named: "favoriteditemenabled"), for: .normal)
        } else {
            repostButton.setBackgroundImage(UIImage(named: "favoriteditem"), for: .normal)
        }
        
        productImageView.contentMode = .scaleAspectFit
        
        stockLabel.text = post.product.stockStatus
        
        productNameLabel.text = post.product.name
        
        priceLabel.text = "$\(post.product.price)"
        
        salePriceLabel.text = "$\(post.product.salePrice)"
        
        numberLikesButton.setImage(UIImage(named: "heart"), for: .normal)
        numberLikesButton.setTitle(" \(post.luvsCount) luvs", for: .normal)
        
        numberRepostsButton.setImage(UIImage(named: "commenticon"), for: .normal)
        numberRepostsButton.setTitle(" \(post.repostCount) reposts", for: .normal)
        
        styleCell()
    }
    
    private func styleCell() {
        
        view.materialDesign = true
        
        view.backgroundColor = UIColor.white
        
        stockLabel.font = UIFont (name: "AvenirNext-Medium", size: 10)
        stockLabel.textColor = RED_COLOR
        
        lineView.backgroundColor = LIGHT_GRAY_COLOR
        
        productNameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        productNameLabel.textColor = DARK_GRAY_COLOR
        productNameLabel.textAlignment = .center
        
        priceLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        priceLabel.textColor = LIGHT_GRAY_COLOR
        priceLabel.attributedText = STRIKE_ATTRIBUTE(text: priceLabel.text!)

        salePriceLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        salePriceLabel.textColor = LIGHT_GRAY_COLOR
        
        numberLikesButton.setTitleColor(DARK_GRAY_COLOR, for: .normal)
        numberLikesButton.titleLabel?.font = UIFont (name: "AvenirNext-Medium", size: 10)
        
        numberRepostsButton.setTitleColor(DARK_GRAY_COLOR, for: .normal)
        numberRepostsButton.titleLabel?.font = UIFont (name: "AvenirNext-Medium", size: 10)
    }
    
    
     func luvTapped() {
        
        if  heartButton.currentBackgroundImage == UIImage(named: "heartitemenabled") {
            heartButton.setBackgroundImage(UIImage(named: "heartitem"), for: .normal)
        } else {
            heartButton.setBackgroundImage(UIImage(named: "heartitemenabled"), for: .normal)
        }
    }
    
    func repostTapped() {
        if  repostButton.currentBackgroundImage == UIImage(named: "favoriteditemenabled") {
            repostButton.setBackgroundImage(UIImage(named: "favoriteditem"), for: .normal)
        } else {
            repostButton.setBackgroundImage(UIImage(named: "favoriteditemenabled"), for: .normal)
        }
    }
    
    private func createConstraints() {
        view.snp.makeConstraints { make in
            // This code centers the label and sets it 10 points from the top of the screen (remember, the superview is the one to which we added the label as a subview, so here, the MainView)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        heartButton.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(7)
            make.height.equalTo(45)
            make.width.equalTo(45)
        }
        
        repostButton.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(45)
            make.width.equalTo(45)
        }
        
        productImageView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(25)
            make.centerX.equalToSuperview()
            make.height.equalTo(190)
        }
        
        stockLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(productImageView.snp.bottom).offset(8)
        }
        
        lineView.snp.makeConstraints { make in
            
            make.top.equalTo(stockLabel.snp.bottom).offset(6)
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(8)
        }
        
        productNameLabel.snp.makeConstraints { make in
            
            make.top.equalTo(lineView.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(8)
        }
        
        priceLabel.snp.makeConstraints { make in
            
            make.top.equalTo(productNameLabel.snp.bottom).offset(7)
        }
        
        salePriceLabel.snp.makeConstraints { make in
            
            make.top.equalTo(productNameLabel.snp.bottom).offset(7)
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(20)
        }
        
        numberLikesButton.snp.makeConstraints { make in
            
            make.top.equalTo(salePriceLabel.snp.bottom).offset(13.5)
            make.leading.equalToSuperview().inset(7)
            make.bottom.equalToSuperview().inset(21.5)
        }
        
        numberRepostsButton.snp.makeConstraints { make in
            
            make.top.equalTo(salePriceLabel.snp.bottom).offset(13.5)
            make.leading.equalTo(numberLikesButton.snp.trailing).offset(8)
            make.bottom.equalToSuperview().inset(21.5)
        }
    }
}
