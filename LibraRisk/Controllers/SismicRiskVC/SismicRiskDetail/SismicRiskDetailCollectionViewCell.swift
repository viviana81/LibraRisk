//
//  SismicRiskDetailCollectionViewCell.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import Kingfisher

class SismicRiskDetailCollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var riskImage: UIImageView!
    
    func configure(withImageUrl imageUrl: String) {
        
        let url = URL(string: imageUrl)
        riskImage.kf.setImage(with: url)
        
    }
}
