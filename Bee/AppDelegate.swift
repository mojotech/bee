//
//  AppDelegate.swift
//  Bee
//
//  Created by Fabian Canas on 6/5/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//

import UIKit
import Parse

var SharedDictionary :WordDictionary?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        SharedDictionary = WordDictionary(wordListURL: NSBundle.mainBundle().URLForResource("words", withExtension: "txt")!)
        
        Parse.enableLocalDatastore()
        Parse.setApplicationId(ParseAppID, clientKey: ParseAppKey)
        
        return true
    }
}

