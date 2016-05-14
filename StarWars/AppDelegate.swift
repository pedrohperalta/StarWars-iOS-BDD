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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

        let rootRouter = RootRouter()
        rootRouter.showInitialViewController(inWindow: self.window!)

        return true
    }
}
