//
//  PlacesCoordinator.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import PromiseKit

class PlacesCoordinator: Coordinator, PlacesViewControllerDelegate {
    
    var coordinators: [Coordinator] = []
    let placesViewController: PlacesViewController
    let navigator: UINavigationController
    private let services: Services
    
    init(services: Services) {
        self.services = services
        placesViewController = PlacesViewController()
        navigator = UINavigationController(rootViewController: placesViewController)
        navigator.tabBarItem = UITabBarItem(title: "Luoghi", image: UIImage(systemName: "globe"), tag: 1)
    }
    
    func start() {
        placesViewController.delegate = self
        // IN PARALLELO
        let placesPromise = getPlaces()
        let collegesPromise = getColleges()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        firstly {
            when(fulfilled: placesPromise, collegesPromise)
        }.done { places, colleges in
            self.placesViewController.places = places
            self.placesViewController.colleges = colleges
        }.ensure {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }.catch { error in
            print(error)
        }
    }
    
    func getPlaces() -> Promise<[Place]> {
        
        return Promise<[Place]> { seal in
            
            services.getPlaces { (places, error) in
                if let places = places {
                    seal.fulfill(places)
                } else if let error = error {
                    seal.reject(error)
                }
            }
        }
    }
    
    func getColleges() -> Promise<[College]> {
        
        return Promise<[College]> { seal in
            
            services.getColleges { (colleges, error) in
                if let colleges = colleges {
                    seal.fulfill(colleges)
                } else if let error = error {
                    seal.reject(error)
                }
            }
        }
    }
    
    func openDetail(withCollege college: College, andPlace place: Place) {
        services.getCollegeResponse(place: place, college: college) { [weak self] (collegeResponse, error) in
            
            if let collegeResponse = collegeResponse {
                let detail = DetailCollegeViewController(collegeResponse: collegeResponse)
                self?.navigator.pushViewController(detail, animated: true)
            }
        }
    }
}

