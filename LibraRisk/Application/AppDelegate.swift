//
//  AppDelegate.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    let services = FakeServices()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setAppearance()
        window = UIWindow()
        
        let home = HomeViewController(services: services)
        let homeNavigation = UINavigationController(rootViewController: home)
        homeNavigation.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let places = PlacesViewController(services: services)
        let placesNavigation = UINavigationController(rootViewController: places)
        placesNavigation.tabBarItem = UITabBarItem(title: "Luoghi", image: UIImage(systemName: "globe"), tag: 1)
        
        let behaviors = BehaviorsViewController(services: services)
        let behaviorsNavigation = UINavigationController(rootViewController: behaviors)
        behaviorsNavigation.tabBarItem = UITabBarItem(title: "Cosa fare", image: UIImage(systemName: "exclamationmark.triangle"), tag: 2)
        
        let notifications = NotificationsViewController(services: services)
        let notificationsNavigation = UINavigationController(rootViewController: notifications)
        notificationsNavigation.tabBarItem = UITabBarItem(title: "Notifiche", image: UIImage(systemName: "bell"), tag: 3)
        
        let tabController = UITabBarController()
        tabController.tabBar.tintColor = .darkGray
        tabController.tabBar.barTintColor = .white
        
        tabController.viewControllers = [homeNavigation, placesNavigation, behaviorsNavigation, notificationsNavigation]
        
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func setAppearance() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor(named: "orange_view")
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }
}

