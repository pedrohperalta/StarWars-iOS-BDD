//
// Created by Pedro Henrique Prates Peralta on 5/14/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit

class RootRouter: NSObject {

    func showInitialViewController(inWindow window: UIWindow) {
        let charactersInteractor = CharactersInteractor()
        let charactersPresenter = CharactersPresenter()
        let charactersViewController = CharactersViewController()
        
        charactersViewController.presenter = charactersPresenter
        charactersPresenter.interactor = charactersInteractor
        charactersInteractor.output = charactersPresenter
        
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [charactersViewController]

        window.backgroundColor = UIColor.whiteColor();
        window.makeKeyAndVisible()
        window.rootViewController = rootViewController
    }
}
