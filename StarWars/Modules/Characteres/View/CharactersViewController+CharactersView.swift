//
//  CharactersViewController+CharactersView.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 6/24/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


extension CharactersViewController: CharactersView {
    
    func showCharactersList(_ charactersList: [[String: String]]) {
        self.charactersList = charactersList
        self.charactersTableView.isHidden = false
        self.emptyDataSetLabel.isHidden = true
    }
    
    
    func showEmptyDatasetScreen() {
        self.charactersTableView.isHidden = true
        self.emptyDataSetLabel.isHidden = false
    }
}
