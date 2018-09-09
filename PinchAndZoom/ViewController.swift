//
//  ViewController.swift
//  PinchAndZoom
//
//  Created by Mark on 09/09/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private static let collectionViewCellIdentifier = "collectionViewCellIdentifier"
    private let imagesToDisplay: [UIImage] = [#imageLiteral(resourceName: "coast"), #imageLiteral(resourceName: "bridge"), #imageLiteral(resourceName: "mountain")] // images from https://www.pexels.com/public-domain-images/
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async {
            self.initViews()
        }
        
    }
    
    private func initViews() {
        initCollectionView()
    }
    
    private func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true

        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.scrollDirection = .horizontal
        
        let nib = UINib(nibName: String(describing: PinchAndZoomCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ViewController.collectionViewCellIdentifier)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.collectionViewCellIdentifier, for: indexPath) as! PinchAndZoomCollectionViewCell
        cell.imageView.image = imagesToDisplay[indexPath.row]
        return cell
    }
    
}
