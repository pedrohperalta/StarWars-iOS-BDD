//
// Created by Pedro Henrique Prates Peralta on 5/15/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

@testable import StarWars
import Quick
import Nimble


class CharactersPresenterTests: QuickSpec {
    
    var sut: CharactersPresenter!
    var charactersInteractorMock: CharactersInteractorMock!
    var charactersViewMock: CharactersViewMock!
    
    
    override func spec() {
        
        beforeSuite {
            self.sut = CharactersPresenter()
            self.charactersInteractorMock = CharactersInteractorMock()
            self.charactersViewMock = CharactersViewMock()
            
            self.sut.interactor = self.charactersInteractorMock
            self.sut.view = self.charactersViewMock
        }
        
        
        describe("The Presenter being loaded") {
            beforeEach {
                self.sut.viewDidLoad()
            }
            
            it("Should ask the Interactor to fetch the characters") {
                expect(self.charactersInteractorMock.fetchCharactersCalled).to(beTrue())
            }
        }
        
        
        describe("The Presenter being notified about the end of the fetch characters operation") {
            context("When a valid list of characters is fetched") {
                beforeEach {
                    self.sut.didFetchCharactersWithSuccess([[:]])
                }
                
                it("Should tell the view to show the list of characters fetched") {
                    expect(self.charactersViewMock.showCharactersListCalled).to(beTrue())
                }
            }
            
            context("When the resquest returns a failure response") {
                beforeEach {
                    self.sut.didFailToFetchCharacters()
                }
                
                it("Should tell the view to show the empty dataset screen") {
                    expect(self.charactersViewMock.showEmptyDatasetScreenCalled).to(beTrue())
                }
            }
        }
        
        
        afterSuite {
            self.sut = nil
            self.charactersInteractorMock = nil
        }
    }
}


class CharactersInteractorMock: CharactersUseCase {

    var fetchCharactersCalled = false
    
    
    func fetchCharacters() {
        fetchCharactersCalled = true
    }
}


class CharactersViewMock: CharactersView {
    
    var showCharactersListCalled = false
    var showEmptyDatasetScreenCalled = false
    
    
    func showCharactersList(_ characters: [[String: String]]) {
        self.showCharactersListCalled = true
    }
    
    
    func showEmptyDatasetScreen() {
        self.showEmptyDatasetScreenCalled = true
    }
}
