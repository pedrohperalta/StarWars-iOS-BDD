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
    
    override func spec() {
        var sut: CharactersViewController!
        var charactersViewControllerOutputMock: CharactersViewControllerOutputMock!
        
        beforeSuite {
            charactersViewControllerOutputMock = CharactersViewControllerOutputMock()
            sut = CharactersViewController()
            sut.presenter = charactersViewControllerOutputMock
        }
        
        afterSuite {
            sut = nil
            charactersViewControllerOutputMock = nil
        }
        
        describe("When view did load") {
            beforeEach {
                sut.viewDidLoad()
            }
            
            it("Should notify the Presenter") {
                expect(charactersViewControllerOutputMock.notifiedWhenViewLoaded).to(beTrue())
            }
        }
    }
}


class CharactersViewControllerOutputMock: CharactersPresentation {
    
    var notifiedWhenViewLoaded = false
    
    
    func viewDidLoad() {
        notifiedWhenViewLoaded = true
    }
}
