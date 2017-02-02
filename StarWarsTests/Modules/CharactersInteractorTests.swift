//
//  CharactersInteractorTests.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/22/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

@testable import StarWars
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
        
        describe("The response for the fetch characters request") {
            context("When a valid list of characters is fetched", {
                beforeEach {
                    stub(condition: isHost("swapi.co") && isPath("/api/people")) { _ in
                        let stubPath = OHPathForFile("characters.json", type(of: self))!
                        
                        return OHHTTPStubsResponse(
                            fileAtPath: stubPath,
                            statusCode: 200,
                            headers: [ "Content-Type": "application/json"]
                        )
                    }
                    
                    self.sut.fetchCharacters()
                }
                
                it("Should notify the Presenter about the success of the operation") {
                    expect(self.charactersPresenterMock.charactersFetchedWithSuccess).toEventually(beTrue(), timeout: 5)
                }
            })
            
            context("When the resquest returns a failure response", {
                beforeEach {
                    stub(condition: isHost("swapi.co") && isPath("/api/people")) { _ in
                        return OHHTTPStubsResponse(error: NSError(domain: "Error", code: 400, userInfo: [:]))
                    }
                    
                    self.sut.fetchCharacters()
                }
                
                it("Should notify the Presenter about the failure of the operation") {
                    expect(self.charactersPresenterMock.charactersFetchedWithError).toEventually(beTrue(), timeout: 5)
                }
            })
        }
        
        
        afterSuite {
            OHHTTPStubs.removeAllStubs()
            self.charactersPresenterMock = nil
            self.sut = nil
        }
    }
}


class CharactersPresenterMock: CharactersInteractorOutput {
    
    var charactersFetchedWithSuccess = false
    var charactersFetchedWithError = false
    
    
    func didFetchCharactersWithSuccess(_ charactersList: [[String: String]]) {
        charactersFetchedWithSuccess = true
    }
    
    
    func didFailToFetchCharacters() {
        charactersFetchedWithError = true
    }
}
