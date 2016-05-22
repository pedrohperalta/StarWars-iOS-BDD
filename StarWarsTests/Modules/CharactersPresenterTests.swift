//
// Created by Pedro Henrique Prates Peralta on 5/15/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import Quick
import Nimble
import StarWars


class CharactersPresenterTests: QuickSpec {
    
    override func spec() {
        var sut: CharactersPresenter!
        var charactersPresenterOutputMock: CharactersPresenterOutputMock!
        
        beforeSuite {
            charactersPresenterOutputMock = CharactersPresenterOutputMock()
            sut = CharactersPresenter()
            sut.interactor = charactersPresenterOutputMock
        }
        
        afterSuite {
            sut = nil
            charactersPresenterOutputMock = nil
        }
        
        describe("When Presenter did load") {
            beforeEach {
                sut.viewDidLoad()
            }
            
            it("Should ask the Interactor to fetch the characters") {
                expect(charactersPresenterOutputMock.fetchCharactersCalled).to(beTrue())
            }
        }
    }
}


// MARK: Class used to isolate the component dependency

class CharactersPresenterOutputMock: NSObject, CharactersUseCase {

    var fetchCharactersCalled = false
    
    
    func fetchCharacters() {
        fetchCharactersCalled = true
    }
}
