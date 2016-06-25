//
//  CharactersViewController+CharactersView.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 6/24/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


extension CharactersViewController: CharactersView {
    
    func showCharactersList(charactersList: [[String: String]]) {
        self.charactersList = charactersList
        self.charactersTableView.hidden = false
        self.emptyDataSetLabel.hidden = true
    }
    
    
    func showEmptyDatasetScreen() {
        self.charactersTableView.hidden = true
        self.emptyDataSetLabel.hidden = false
    }
}
