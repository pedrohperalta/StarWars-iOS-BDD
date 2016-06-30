//
//  CharactersViewControllerTests.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/14/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

@testable import StarWars
import Quick
import Nimble


class CharactersViewControllerTests: QuickSpec {
    
    var sut: CharactersViewController!
    var charactersViewControllerPresenterMock: CharactersViewControllerPresenterMock!
    var charactersList: [[String: String]]!
    
    
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

            it("Should have an UITableView not null") {
                expect(self.sut.charactersTableView).toNot(beNil())
            }

            it("Should have an UITableView as a child view") {
                expect(self.sut.view.subviews.contains(self.sut.charactersTableView)).to(beTrue())
            }

            it("Should conform to UITableViewDataSource protocol") {
                expect(self.sut.conformsToProtocol(UITableViewDataSource)).to(beTrue())
            }

            it("Should have an UITableView with DataSource") {
                expect(self.sut.charactersTableView.dataSource).toNot(beNil())
            }

            it("Should have an UILabel for empty dataset message as a child view") {
                expect(self.sut.view.subviews.contains(self.sut.emptyDataSetLabel)).to(beTrue())
            }
        }


        describe("The View being told to show the characters list") {
            beforeEach {
                self.charactersList = [[:]]
                self.sut.showCharactersList(self.charactersList)
            }

            it("Should have the table view set as visible") {
                expect(self.sut.charactersTableView.hidden).to(beFalse())
            }

            it("Should have the empty dataset message label set as invisible") {
                expect(self.sut.emptyDataSetLabel.hidden).to(beTrue())
            }
            
            it("Should set the characters' list for the data source") {
                expect(self.sut.charactersList).to(equal(self.charactersList))
            }

            it("Should have a row for each character in the table view") {
                let expectedRows = self.charactersList.count
                print("Expected rows: \(expectedRows)")
                expect(self.sut.charactersTableView.numberOfRowsInSection(0)).to(equal(expectedRows))
            }
            
            it("Should return a valid cell when it's dequeued from the table view") {
                let cell = self.sut.charactersTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
                expect(cell).notTo(beNil())
            }
        }


        describe("The View being told to show the empty dataset screen") {
            beforeEach {
                self.sut.showEmptyDatasetScreen()
            }

            it("Should shown the proper message in the empty dataset label") {
                expect(self.sut.emptyDataSetLabel.text).to(equal("No characters to show =("))
            }

            it("Should have the empty dataset message label set as visible") {
                expect(self.sut.emptyDataSetLabel.hidden).to(beFalse())
            }

            it("Should have the table view set as invisible") {
                expect(self.sut.charactersTableView.hidden).to(beTrue())
            }
        }
        
        
        describe("The characters list being set") {
            beforeEach {
                self.sut.charactersTableView = CharactersTableViewMock()
                self.sut.charactersList = []
            }
            
            it("Should reload the characters' table view data") {
                expect((self.sut.charactersTableView as! CharactersTableViewMock).reloadDataCalled).to(beTrue())
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


class CharactersTableViewMock: UITableView {
    
    var reloadDataCalled = false
    
    
    override func reloadData() {
        self.reloadDataCalled = true
        super.reloadData()
    }
}
