//
//  CharactersViewController+Private.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 6/24/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


extension CharactersViewController {
    
    func setupView() {
        self.view.addSubview(self.emptyDataSetLabel)
        self.view.addSubview(self.charactersTableView)
    }
    
    
    func setupConstraints() {
        self.charactersTableView.snp_makeConstraints { make -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(25, 0, 0, 0))
        }
        
        self.emptyDataSetLabel.snp_makeConstraints { make -> Void in
            make.left.greaterThanOrEqualTo(self.view.snp_left).offset(30)
            make.right.greaterThanOrEqualTo(self.view.snp_right).offset(-30)
            make.center.equalTo(self.view.snp_center)
        }
    }
}
