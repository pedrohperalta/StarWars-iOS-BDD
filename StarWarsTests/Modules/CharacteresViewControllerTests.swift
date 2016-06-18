//
//  CharactersViewControllerTests.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/14/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import StarWars
import Quick
import Nimble


class CharactersViewControllerTests: QuickSpec {
    
    var sut: CharactersViewController!
    var charactersViewControllerPresenterMock: CharactersViewControllerPresenterMock!
    
    
    override func spec() {
        
        beforeSuite {
            self.sut = CharactersViewController()
            self.charactersViewControllerPresenterMock = CharactersViewControllerPresenterMock()
            self.sut.presenter = self.charactersViewControllerPresenterMock
        }
        
        
        describe("The View being loaded") {
            beforeEach {
                self.sut.viewDidLoad()
            }
            
            it("Should notify the Presenter about its life cycle") {
                expect(self.charactersViewControllerPresenterMock.notifiedWhenViewLoaded).to(beTrue())
            }
        }
        
        
        afterSuite {
            self.sut = nil
            self.charactersViewControllerPresenterMock = nil
        }
    }
}


class CharactersViewControllerPresenterMock: CharactersPresentation {
    
    var notifiedWhenViewLoaded = false
    
    
    func viewDidLoad() {
        notifiedWhenViewLoaded = true
    }
}
