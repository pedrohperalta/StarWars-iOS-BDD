//
//  AppDelegate.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/9/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let rootRouter = RootRouter()
        rootRouter.presentCharactersScreen(inWindow: self.window!)

        return true
    }
}
