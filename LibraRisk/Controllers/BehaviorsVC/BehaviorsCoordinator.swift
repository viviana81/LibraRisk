//
//  BehaviorsCoordinator.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class BehaviorsCoordinator: Coordinator, BehaviorsViewControllerDelegate {
   
    var coordinators: [Coordinator] = []
    
    let behaviorsViewController: BehaviorsViewController
    let navigator: UINavigationController
    private let services: Services
    
    init(services: Services) {
       self.services = services
       behaviorsViewController = BehaviorsViewController()
        navigator = UINavigationController(rootViewController: behaviorsViewController)
        navigator.tabBarItem = UITabBarItem(title: "Cosa fare", image: UIImage(systemName: "exclamationmark.triangle"), tag: 2)
       
    }
    
    func start() {
         getBehaviors()
         behaviorsViewController.delegate = self
    }
    
    func getBehaviors() {
        services.getBehaviors { (behaviors, error) in
            if let behaviors = behaviors {
                self.behaviorsViewController.behaviors = behaviors
                
            }
        }
    }
    
    func openBehavior(_ behavior: Behavior) {
           let detail = BehaviorDetailViewController(behavior: behavior)
          navigator.pushViewController(detail, animated: true)
       }
}

