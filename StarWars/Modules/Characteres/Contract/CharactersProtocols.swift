//
// Created by Pedro Henrique Prates Peralta on 5/14/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import Foundation


protocol CharactersView: class {
    func showCharactersList(charactersList: [[String: String]])
    func showEmptyDatasetScreen()
}


protocol CharactersPresentation: class {
    func viewDidLoad()
}


protocol CharactersUseCase: class {
    func fetchCharacters()
}


protocol CharactersInteractorOutput: class {
    func didFetchCharactersWithSuccess(charactersList: [[String: String]])
    func didFailToFetchCharacters()
}
