//
// Created by Pedro Henrique Prates Peralta on 5/14/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit


class RootRouter: NSObject, RootWireframe {

    // Properties

    var charactersViewController: CharactersViewController!


    // MARK: RootWireframe

    func presentCharactersScreen(inWindow window: UIWindow) {
        self.assembleCharactersModule()

        window.backgroundColor = UIColor.white;
        window.makeKeyAndVisible()
        window.rootViewController = self.charactersViewController
    }


    // MARK: Private

    func assembleCharactersModule() {
        self.charactersViewController = CharactersViewController()
        let charactersPresenter = CharactersPresenter()
        let charactersInteractor = CharactersInteractor()

        charactersViewController.presenter = charactersPresenter

        charactersPresenter.view = charactersViewController
        charactersPresenter.interactor = charactersInteractor

        charactersInteractor.output = charactersPresenter
    }
}
