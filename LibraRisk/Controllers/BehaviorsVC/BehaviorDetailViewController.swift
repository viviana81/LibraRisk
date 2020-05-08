//
//  BehaviorDetailViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 01/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class BehaviorDetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let behavior: Behavior
    
    init(behavior: Behavior) {
        self.behavior = behavior
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        title = "Dettaglio"
        titleLabel.text = behavior.title
        subtitleLabel.text = behavior.subtitle
        descriptionTxtView.text = behavior.description
        
        collectionView.register(UINib(nibName: "BehaviorDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "behaviorDetailCell")
    }
}

extension BehaviorDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return behavior.imageUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "behaviorDetailCell", for: indexPath) as! BehaviorDetailCollectionViewCell
        let image = behavior.imageUrl[indexPath.item]
        cell.configure(withImageUrl: image)
        return cell
    }
}

extension BehaviorDetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        self.pageControl.currentPage = indexPath.item
    }
}
