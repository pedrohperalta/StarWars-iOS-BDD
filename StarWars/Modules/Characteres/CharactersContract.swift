//
// Created by Pedro Henrique Prates Peralta on 5/14/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import Foundation


protocol CharactersPresentation: class {
    func viewDidLoad()
}


protocol CharactersUseCase: class {
    func fetchCharacters()
}


protocol CharactersInteractorOutput: class {
    func onCharactersFetchError()
    func onCharactersFetched()
}
