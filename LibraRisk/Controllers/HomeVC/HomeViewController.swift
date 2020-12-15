//
//  ViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func showEarthQuake()
    func showSismicRisk()
}

class HomeViewController: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var secondShadowView: UIView!

    var delegate: HomeViewControllerDelegate?
    
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
        delegate?.showEarthQuake()
    }
    
    @objc
    func openSismicRisk(_ recognizer: UIGestureRecognizer) {
        delegate?.showSismicRisk()
    }
}
