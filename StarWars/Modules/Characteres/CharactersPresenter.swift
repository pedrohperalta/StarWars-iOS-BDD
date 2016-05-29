//
//  CharactersPresenter.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/14/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


class CharactersPresenter: CharactersPresentation, CharactersInteractorOutput {
    
    // MARK: Attributes
    
    var interactor: CharactersUseCase!
    
    
    // MARK: CharactersPresentation
    
    func viewDidLoad() {
        self.interactor.fetchCharacters()
    }
    
    
    // MARK: CharactersInteractorOutput
    
    func onCharactersFetched() {
        // TODO: Notify View
    }
    
    func onCharactersFetchError() {
        // TODO: Notify View
    }
}
