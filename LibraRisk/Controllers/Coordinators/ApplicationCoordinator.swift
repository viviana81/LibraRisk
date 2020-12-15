//
//  ApplicationCoordinator.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    private let services: Services
    var window: UIWindow
    
    init(window: UIWindow, services: Services) {
        self.services = services
        self.window = window
    }
    
    func start() {
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .darkGray
        tabBarController.tabBar.barTintColor = .white
        
        
        let homeCoordinator = HomeCoordinator(services: services)
        let placesCoordinator = PlacesCoordinator(services: services)
        let behaviorsCoordinator = BehaviorsCoordinator(services: services)
        let notificationsCoordinator = NotificationsCoordinator(services: services)
        
        coordinators.append(homeCoordinator)
        coordinators.append(placesCoordinator)
        coordinators.append(behaviorsCoordinator)
        coordinators.append(notificationsCoordinator)
        
        tabBarController.viewControllers = [
            homeCoordinator.navigator,
            placesCoordinator.navigator,
            behaviorsCoordinator.navigator,
            notificationsCoordinator.navigator
        ]
        
        coordinators.forEach { $0.start() } // lanciamo tutti gli start dei coordinators
        
        window.rootViewController = tabBarController
    }
}

