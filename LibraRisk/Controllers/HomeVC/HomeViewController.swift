//
//  ViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var secondShadowView: UIView!
    var tapGesture = UITapGestureRecognizer()
    private let services: Services
    
    init(services: Services) {
        self.services = services
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 6
        
        secondShadowView.layer.shadowColor = UIColor.gray.cgColor
        secondShadowView.layer.shadowOpacity = 0.6
        secondShadowView.layer.shadowOffset = CGSize.zero
        secondShadowView.layer.shadowRadius = 6
        
        let firstTap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.viewEartQuake(_:)))
        shadowView.addGestureRecognizer(firstTap)
        
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.openSismicRisk(_:)))
        secondShadowView.addGestureRecognizer(secondTap)
    }
    
    @objc
    func viewEartQuake(_ recognizer: UIGestureRecognizer) {
       let earthQuake = EarthQuakeViewController(services: services)
        navigationController?.pushViewController(earthQuake, animated: true)
    }
    
    @objc
    func openSismicRisk(_ recognizer: UIGestureRecognizer) {
       let sismicRisk = SismicRiskViewController(services: services)
        navigationController?.pushViewController(sismicRisk, animated: true)
    }
}

