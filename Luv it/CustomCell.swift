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
    var productImageView = UIImageView()
    var stockLabel = UILabel()
    var lineView = UIView()
    var productNameLabel = UILabel()
    var priceLabel = UILabel()
    var salePriceLabel = UILabel()
    var numberLikesButton = UIButton()
    var numberRepostsButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeUI()
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func initializeUI() {
        configureCell()
        view.backgroundColor = UIColor.red
        lineView.backgroundColor = UIColor.blue
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
    
    private func configureCell() {
        
        view.materialDesign = true
        heartButton.setImage(UIImage(named: "heartitemenabled"), for: .normal)
        repostButton.setImage(UIImage(named: "favoriteditemenabled"), for: .normal)
        productImageView.image = UIImage(named: "jacket")
        stockLabel.text = "Low Stock"
        productNameLabel.text = "Ipad Pro 128 Gb - Space Gray"
        priceLabel.text = "$1000"
        salePriceLabel.text = "$500"
        
        numberLikesButton.setImage(UIImage(named: "heart"), for: .normal)
        numberLikesButton.setTitle(" 1234 likes", for: .normal)
        
        numberRepostsButton.setImage(UIImage(named: "commenticon"), for: .normal)
        numberRepostsButton.setTitle("1234 Reposts", for: .normal)
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
        }
        
        repostButton.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        productImageView.snp.makeConstraints { make in
            
            make.top.equalTo(repostButton.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(8)
            make.height.equalTo(174)
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


