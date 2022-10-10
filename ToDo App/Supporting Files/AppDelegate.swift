//
//  AppDelegate.swift
//  ToDo App
//
//  Created by Stanislav Demyanov on 09.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let storageManager = StorageManager.shared
    var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: TaskListViewController())
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        storageManager.saveContext()
    }
}

