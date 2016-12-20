//
//  MainView.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 20/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    private(set) var label = UILabel()
    private(set) var textField = UITextField()
    private(set) var button = UIButton()
    private(set) var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.white
        initializeUI()
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeUI() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        addSubview(tableView)
        addSubview(label)
        addSubview(button)
        addSubview(textField)
        // This can be shortened to simply addSubviews([label, button, textField]) with the help of an extension available in this library)
        label.text = "Type something"
        textField.placeholder = "Anything"
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Submit", for: .normal)
    }
    
    private func createConstraints() {
        
        
        /*
         label.snp.makeConstraints { make in
         // This code centers the label and sets it 10 points from the top of the screen (remember, the superview is the one to which we added the label as a subview, so here, the MainView)
         make.centerX.equalToSuperview()
         make.top.equalToSuperview().inset(30)
         }
         textField.snp.makeConstraints { make in
         // This sets the text field 10 points from the bottom of the label, and at the center of the screen
         make.top.equalTo(label.snp.bottom).offset(30)
         make.centerX.equalToSuperview()
         }
         button.snp.makeConstraints { make in
         // Similarly, this sets the button 30 points from the text field and at the center of the screen
         make.top.equalTo(textField.snp.bottom).offset(30)
         make.centerX.equalToSuperview()
         }
         */
    }
    
}
