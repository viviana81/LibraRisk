//
//  SismicRiskDetailViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 30/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class SismicRiskDetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let sismicRisk: SismicRisk
    
    init(sismicRisk: SismicRisk) {
        self.sismicRisk = sismicRisk
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dettaglio"
        titleLabel.text = sismicRisk.title
        subtitleLabel.text = sismicRisk.subtitle
        descriptionTxtView.text = sismicRisk.description
        
        collectionView.register(SismicRiskDetailCollectionViewCell.self)
    }
    
}

extension SismicRiskDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sismicRisk.imageUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SismicRiskDetailCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath) 
        let image = sismicRisk.imageUrl[indexPath.item]
        cell.configure(withImageUrl: image)
        return cell
    }
}

extension SismicRiskDetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        self.pageControl.currentPage = indexPath.item
    }
}
