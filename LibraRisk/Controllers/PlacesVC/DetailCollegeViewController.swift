//
//  DetailCollegeViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 04/05/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit

class DetailCollegeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let collegeResponse: CollegeResponse
    
    init(collegeResponse: CollegeResponse) {
        self.collegeResponse = collegeResponse
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(collegeResponse.title)"
        titleLabel.text = collegeResponse.title
        subtitleLabel.text = collegeResponse.subtitle
        descriptionTxtView.text = collegeResponse.description
        collectionView.register(DetailCollegeCollectionViewCell.self)
    }
}

extension DetailCollegeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collegeResponse.imageUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DetailCollegeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let image = collegeResponse.imageUrl[indexPath.item]
        cell.configure(withImageUrl: image)
        return cell
    }
}

extension DetailCollegeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        self.pageControl.currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = collegeResponse.imageUrl[indexPath.item]
        let detailImage = DetailImageViewController(image: image)
        navigationController?.pushViewController(detailImage, animated: true)
    }
}

