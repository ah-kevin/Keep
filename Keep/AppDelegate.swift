//
//  AppDelegate.swift
//  Keep
//
//  Created by 柯秉钧 on 2016/9/26.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var isLogin = false
    var mainViewVC:UIViewController?{
//        t isLogin = false
        return isLogin ? UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() : UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //设置Window
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = mainViewVC
        window?.makeKeyAndVisible()
        
        //修改电池状态条
        UIApplication.shared.statusBarStyle = .lightContent
        //设置全局的全局的UINavigationBar
        let bar = UINavigationBar.appearance()
        bar.barTintColor = MAIN_COLOR
        bar.isTranslucent = false
        bar.tintColor = UIColor.white
        bar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        //修改UItabbar的属性
        let tabbarItem = UITabBarItem.appearance()
        tabbarItem.setTitleTextAttributes([NSForegroundColorAttributeName:MAIN_COLOR], for: .selected)
        UITabBar.appearance().tintColor = MAIN_COLOR
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Keep")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

func KLog<T>(_ message: T, fileName: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("\((fileName as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

