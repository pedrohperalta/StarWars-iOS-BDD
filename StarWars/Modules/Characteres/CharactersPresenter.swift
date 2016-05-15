//
//  CharactersPresenter.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/14/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


class CharactersPresenter: NSObject, CharactersPresentation {
    
    // MARK: Attributes
    
    var interactor: CharactersUseCase!
    
    
    // MARK: Public
    
    override init() {
    }
    
    
    // MARK: CharactersViewControllerOutput
    
    func viewDidLoad() {
        self.interactor.fetchCharacters()
    }
}
