//
//  CharactersViewController.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/9/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController, CharactersView {

    // MARK: Attributes

    var presenter: CharactersPresentation!


    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    
    // MARK: CharactersView Protocol
    
    func showCharactersList() {
        // TODO
    }
    
    
    func showEmptyDatasetScreen() {
        // TODO
    }
}
