//
//  CharactersInteractorTests.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/22/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import StarWars
import Quick
import Nimble
import OHHTTPStubs


class CharactersInteractorTests: QuickSpec {
    
    var sut: CharactersInteractor!
    var charactersPresenterMock: CharactersPresenterMock!
    
    override func spec() {
        
        beforeSuite {
            self.charactersPresenterMock = CharactersPresenterMock()
            self.sut = CharactersInteractor()
            self.sut.output = self.charactersPresenterMock
        }
        
        afterSuite {
            OHHTTPStubs.removeAllStubs()
            self.charactersPresenterMock = nil
            self.sut = nil
        }
        
        describe("Interactor should notify the Presenter when it finishes fetching the characters") {
            
            context("List of characters is fetched successfully", {
                
                beforeEach {
                    stub(isHost("swapi.co") && isPath("/api/people")) { _ in
                        return OHHTTPStubsResponse(JSONObject: [:], statusCode: 200, headers: [ "Content-Type": "application/json"])
                    }
                    
                    self.sut.fetchCharacters()
                }
                
                it("Should notify the success of the operation") {
                    expect(self.charactersPresenterMock.charactersFetchedWithSuccess).toEventually(beTrue(), timeout: 5)
                }
            })
            
            context("List of characters is NOT fetched successfully", {
                
                beforeEach {
                    stub(isHost("swapi.co") && isPath("/api/people")) { _ in
                        return OHHTTPStubsResponse(error: NSError(domain: "Error", code: 400, userInfo: [:]))
                    }
                    
                    self.sut.fetchCharacters()
                }
                
                it("Should notify an error has happened") {
                    expect(self.charactersPresenterMock.charactersFetchedWithError).toEventually(beTrue(), timeout: 5)
                }
            })
        }
    }
}


class CharactersPresenterMock: CharactersInteractorOutput {
    
    var charactersFetchedWithSuccess = false
    var charactersFetchedWithError = false
    
    
    func onCharactersFetched() {
        charactersFetchedWithSuccess = true
    }
    
    func onCharactersFetchError() {
        charactersFetchedWithError = true
    }
}
