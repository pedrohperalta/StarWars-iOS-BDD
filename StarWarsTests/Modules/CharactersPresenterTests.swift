//
// Created by Pedro Henrique Prates Peralta on 5/15/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

@testable import StarWars
import XCTest
import Foundation


class CharactersPresenterTests: XCTestCase {

    var presenter: CharactersPresenter!

    override func setUp() {
        super.setUp()
        self.presenter = CharactersPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShouldAskInteractorToFetchCharactersWhenPresenterDidLoad() {
        // Given
        let charactersPresenterOutputSpy = CharactersPresenterOutputSpy()
        self.presenter.interactor = charactersPresenterOutputSpy

        // When
        self.presenter.viewDidLoad()

        // Then
        XCTAssert(charactersPresenterOutputSpy.fetchCharactersCalled, "Should ask the Interactor to fetch the characters")
    }
}


// MARK: Class used to isolate the component dependency

class CharactersPresenterOutputSpy: NSObject, CharactersUseCase {

    // MARK: Method call expectations

    var fetchCharactersCalled = false


    // MARK: Spied methods

    func fetchCharacters() {
        fetchCharactersCalled = true
    }
}
