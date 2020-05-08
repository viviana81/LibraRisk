//
//  BehaviorDetailCollectionViewCell.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 01/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class BehaviorDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var behaviorImage: UIImageView!
    
    func configure(withImageUrl imageUrl: String) {
        
        let url = URL(string: imageUrl)
        behaviorImage.kf.setImage(with: url)
        
    }
}
