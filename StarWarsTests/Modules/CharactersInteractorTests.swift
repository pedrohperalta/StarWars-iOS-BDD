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
    var charactersInteractorOutputMock: CharactersInteractorOutputMock!
    
    override func spec() {
        
        beforeSuite {
            self.charactersInteractorOutputMock = CharactersInteractorOutputMock()
            self.sut = CharactersInteractor()
            self.sut.output = self.charactersInteractorOutputMock
        }
        
        afterSuite {
            OHHTTPStubs.removeAllStubs()
            self.charactersInteractorOutputMock = nil
            self.sut = nil
        }
        
        describe("Interactor should notify the Presenter when it finishes fetching the characters") {
            
            context("List of characters is fetched successfully", {
                
                beforeEach {
                    stub(isHost("swapi.co") && isPath("/api/people")) { _ in
                        return OHHTTPStubsResponse(JSONObject: [:], statusCode: 200, headers: [ "Content-Type": "application/json"])
                    }
                }
                
                it("Should notify the success of the operation") {
                    self.sut.fetchCharacters()
                    expect(self.charactersInteractorOutputMock.charactersFetchedWithSuccess).toEventually(beTrue(), timeout: 5)
                }
            })
            
            context("List of characters is NOT fetched successfully", {
                
                beforeEach {
                    stub(isHost("swapi.co") && isPath("/api/people")) { _ in
                        return OHHTTPStubsResponse(error: NSError(domain: "Error", code: 400, userInfo: [:]))
                    }
                }
                
                it("Should notify an error has happened") {
                    self.sut.fetchCharacters()
                    expect(self.charactersInteractorOutputMock.charactersFetchedWithError).toEventually(beTrue(), timeout: 5)
                }
            })
        }
    }
}


class CharactersInteractorOutputMock: CharactersInteractorOutput {
    
    var charactersFetchedWithSuccess = false
    var charactersFetchedWithError = false
    
    
    func onCharactersFetched() {
        charactersFetchedWithSuccess = true
    }
    
    func onCharactersFetchError() {
        charactersFetchedWithError = true
    }
}
