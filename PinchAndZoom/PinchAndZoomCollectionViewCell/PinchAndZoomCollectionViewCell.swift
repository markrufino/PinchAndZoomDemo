//
//  PinchAndZoomCollectionViewCell.swift
//  PinchAndZoom
//
//  Created by Mark on 09/09/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import UIKit

class PinchAndZoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initViews()
    }
    
    private func initViews() {
        initScrollView()
    }

    private func initScrollView() {
        scrollView.delegate = self
        scrollView.maximumZoomScale = 5
        scrollView.minimumZoomScale = 1
    }
}

extension PinchAndZoomCollectionViewCell: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
