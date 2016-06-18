//
// Created by Pedro Henrique Prates Peralta on 5/15/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import StarWars
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
        
        
        describe("When Presenter did load") {
            beforeEach {
                self.sut.viewDidLoad()
            }
            
            it("Should ask the Interactor to fetch the characters") {
                expect(self.charactersInteractorMock.fetchCharactersCalled).to(beTrue())
            }
        }
        
        
        describe("When Presenter is notified about the end of the characters fetch") {
            context("List of characters is fetched successfully") {
                beforeEach {
                    self.sut.onCharactersFetched()
                }
                
                it("Should tell the view to show the list of characters fetched") {
                    expect(self.charactersViewMock.showCharactersListCalled).to(beTrue())
                }
            }
            
            context("List of characters is NOT fetched successfully") {
                beforeEach {
                    self.sut.onCharactersFetchError()
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
    
    
    func showCharactersList() {
        self.showCharactersListCalled = true
    }
    
    
    func showEmptyDatasetScreen() {
        self.showEmptyDatasetScreenCalled = true
    }
}
