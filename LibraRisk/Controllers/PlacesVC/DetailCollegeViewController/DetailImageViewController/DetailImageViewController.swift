//
//  DetailImageViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 04/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import Kingfisher

class DetailImageViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    private let image: String
    
    init(image: String) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: image)
        detailImage.kf.setImage(with: url)
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .landscape
       }
}

class NavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
        return topViewController?.shouldAutorotate ?? false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
    }
}

