//
//  AppDelegate.swift
//  Trax
//
//  Created by 杨晓冬 on 16/2/22.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        print("url = \(url)")
        return true
    }

}

