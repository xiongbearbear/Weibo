//
//  AppDelegate.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        sleep(2)
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = XBBMainViewController()
        window?.makeKeyAndVisible()
        
        
        return true
    }



}

