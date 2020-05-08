//
//  BehaviorsTableViewCell.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 01/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import Kingfisher

class BehaviorsTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var behaviorImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 6
    }
    
    func configure(withBehavior behavior: Behavior) {
        if let image = behavior.imageUrl.first {
            let url = URL(string: image)
            behaviorImage.kf.setImage(with: url)
        }
        titleLabel.text = behavior.title
        subtitleLabel.text = behavior.subtitle
    }
}
