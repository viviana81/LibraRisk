//
//  DetailCollegeCollectionViewCell.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 04/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import Kingfisher

class DetailCollegeCollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var collegeImage: UIImageView!

    func configure(withImageUrl imageUrl:String) {
        let url = URL(string: imageUrl)
        collegeImage.kf.setImage(with: url)
    }
}
