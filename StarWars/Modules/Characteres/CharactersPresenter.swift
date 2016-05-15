//
//  CharactersPresenter.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/14/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


class CharactersPresenter: NSObject, CharactersViewControllerOutput {
    
    // MARK: Attributes
    
    var interactor: CharactersPreseterOutput!
    
    
    // MARK: Public
    
    override init() {
    }
    
    
    // MARK: CharactersViewControllerOutput
    
    func viewDidLoad() {
        self.interactor.fetchCharacters()
    }
}
