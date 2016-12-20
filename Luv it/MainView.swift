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
    
    private(set) var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        initializeUI()
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeUI() {
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        addSubview(tableView)
    }
    
    private func createConstraints() {
        
         tableView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(0)
            make.leading.equalToSuperview().inset(0)
            make.trailing.equalToSuperview().inset(0)
         }
    }
    
}
