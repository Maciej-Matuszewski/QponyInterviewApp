//
//  AppDelegate.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import UIKit
import KVNProgress

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.initialize()
        
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = WeatherViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }

    func initialize(){
        let config = KVNProgressConfiguration.init()
        config.backgroundTintColor = Constants.kColorBackground
        config.circleStrokeForegroundColor = Constants.kColorLightFont
        config.successColor = Constants.kColorLightFont
        config.statusColor = Constants.kColorLightFont
        config.errorColor = Constants.kColorLightFont
        config.statusFont = Constants.kFontNormal
        config.fullScreen = true
        KVNProgress.setConfiguration(config)
    }

}

