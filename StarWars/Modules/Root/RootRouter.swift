//
// Created by Pedro Henrique Prates Peralta on 5/14/16.
// Copyright (c) 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit

class RootRouter: NSObject {

    func showInitialViewController(inWindow window: UIWindow) {
        window.backgroundColor = UIColor.whiteColor();
        window.makeKeyAndVisible()

        let rootViewController = UINavigationController()
        let characteresViewController = CharacteresViewController()
        rootViewController.viewControllers = [characteresViewController]

        window.rootViewController = rootViewController
    }
}
