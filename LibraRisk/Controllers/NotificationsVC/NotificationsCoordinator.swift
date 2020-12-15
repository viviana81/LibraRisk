//
//  NotificationsCoordinator.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class NotificationsCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    let notificationsViewController: NotificationsViewController
    let navigator: UINavigationController
    private let services: Services
    
    init(services: Services) {
        self.services = services
       notificationsViewController = NotificationsViewController()
        navigator = UINavigationController(rootViewController: notificationsViewController)
       navigator.tabBarItem = UITabBarItem(title: "Notifiche", image: UIImage(systemName: "bell"), tag: 3)
    }
    
    func start() {
        getNotifications()
    }
    
    func getNotifications() {
        services.getNotifications { [weak self](notifications, error) in
            if let notifications = notifications {
                self?.notificationsViewController.notifications = notifications
                
            }
        }
    }
}
