//
//  HomeCoordinator.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator, HomeViewControllerDelegate {
   
    var coordinators: [Coordinator] = []
    let homeViewController: HomeViewController
    let navigator: UINavigationController
    private let services: Services
    
    init(services: Services) {
        self.services = services
        homeViewController = HomeViewController()
        navigator = UINavigationController(rootViewController: homeViewController)
        navigator.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
    }
    
    func start() {
        homeViewController.delegate = self
    }
    
    func showEarthQuake() {
       let earthQuake = EarthQuakeViewController(services: services)
       navigator.pushViewController(earthQuake, animated: true)
    }
    
    func showSismicRisk() {
        let sismicRisk = SismicRiskViewController(services: services)
        navigator.pushViewController(sismicRisk, animated: true)
    }
}
