//
//  CharactersViewControllerTests.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/14/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

@testable import StarWars
import XCTest


class CharactersViewControllerTests: XCTestCase {
    
    var viewController: CharactersViewController!
    
    override func setUp() {
        super.setUp()
        self.viewController = CharactersViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldNotifyPresenterWhenViewDidLoad() {
        // Given
        let charactersViewControllerOutputSpy = CharactersViewControllerOutputSpy()
        self.viewController.presenter = charactersViewControllerOutputSpy
        
        // When
        self.viewController.viewDidLoad()
        
        // Then
        XCTAssert(charactersViewControllerOutputSpy.notifiedWhenViewLoaded, "Should notify Presenter when the view is loaded")
    }
}


// MARK: Class used to isolate the component dependency

class CharactersViewControllerOutputSpy: CharactersPresentation {
    
    // MARK: Method call expectations
    
    var notifiedWhenViewLoaded = false
    
    
    // MARK: Spied methods
    
    func viewDidLoad() {
        notifiedWhenViewLoaded = true
    }
}
